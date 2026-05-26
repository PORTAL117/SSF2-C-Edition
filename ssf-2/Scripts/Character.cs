using Godot;
using System.Collections.Generic;

public partial class Character : CharacterBody2D
{
    [Export] public float Speed = 300f;
    [Export] public float JumpForce = -700f;
    [Export] public float Gravity = 1800f;

    private AnimationPlayer _animationPlayer;
    private Sprite2D _sprite;
    private string _currentAnimation = "";
    private bool _canDoubleJump = false;
    private bool _wasOnGround = false;

    private bool _leftGroundWithoutJumping = false;

    private Dictionary<string, (string prefix, int frames, float fps, bool loop)> _animations = new()
    {
        { "idle",       ("idle", 16, 30f, true) },
        { "run",        ("r",    8,  30f, true) },
        { "jump",       ("j",    7,  12f, false) },
        { "fall",       ("f",    4,  12f, false) },
        { "doublejump", ("jj",   12, 12f, false) },
    };

    public override void _Ready()
    {
        _animationPlayer = GetNode<AnimationPlayer>("AnimationPlayer");
        _sprite = GetNode<Sprite2D>("Sprite2D");

        _animationPlayer.AddAnimationLibrary("mario", new AnimationLibrary());

        foreach (var anim in _animations)
            LoadAnimation(anim.Key, anim.Value.prefix, anim.Value.frames, anim.Value.fps, anim.Value.loop);

        PlayAnimation("idle");
    }

    private void LoadAnimation(string name, string prefix, int frames, float fps, bool loop)
    {
        string folder = name.Substring(0, 1).ToUpper() + name.Substring(1);
        string path = $"res://Assets/Sprites/Mario/{folder}/";

        var animation = new Animation();
        animation.Length = frames / fps;
        animation.LoopMode = loop
            ? Animation.LoopModeEnum.Linear
            : Animation.LoopModeEnum.None;

        int trackIndex = animation.AddTrack(Animation.TrackType.Value);
        animation.TrackSetPath(trackIndex, "Sprite2D:texture");

        int loaded = 0;
        for (int i = 0; i < frames; i++)
        {
            var dir = DirAccess.Open(path);
            if (dir == null)
            {
                GD.PrintErr($"Folder not found: {path}");
                return;
            }

            dir.ListDirBegin();
            string fileName = dir.GetNext();
            while (fileName != "")
            {
                if (fileName.Contains($"{prefix}{i}") && fileName.EndsWith(".png"))
                {
                    var texture = GD.Load<Texture2D>(path + fileName);
                    animation.TrackInsertKey(trackIndex, i / fps, texture);
                    loaded++;
                    break;
                }
                fileName = dir.GetNext();
            }
        }

        GD.Print($"Animation '{name}': {loaded}/{frames} frames loaded");

        var library = _animationPlayer.GetAnimationLibrary("mario");
        library.AddAnimation(name, animation);
    }

    private void PlayAnimation(string name)
    {
        string fullName = $"mario/{name}";
        if (_currentAnimation != fullName)
        {
            _currentAnimation = fullName;
            _animationPlayer.Play(fullName);
        }
    }

    public override void _Process(double delta)
    {
        if (!_animationPlayer.IsPlaying())
        {
            if (_currentAnimation == "mario/jump" || _currentAnimation == "mario/doublejump")
                PlayAnimation("fall");
            else
                _currentAnimation = "";
        }
    }

    public override void _PhysicsProcess(double delta)
    {
        Vector2 velocity = Velocity;

        // Detect floor by collision normal
        bool onGround = false;
        // If just left ground without jumping, grant aerial jump
        if (_wasOnGround && !onGround && !_canDoubleJump)
            _canDoubleJump = true;

        for (int i = 0; i < GetSlideCollisionCount(); i++)
        {
            var collision = GetSlideCollision(i);
            if (collision.GetNormal().Y < -0.7f)
            {
                onGround = true;
                break;
            }
        }

        // Gravity
        if (!onGround)
            velocity.Y += Gravity * (float)delta;

        // Horizontal movement
        float direction = 0f;
        if (Input.IsActionPressed("ui_right")) direction += 1f;
        if (Input.IsActionPressed("ui_left")) direction -= 1f;
        velocity.X = direction * Speed;

        // Flip sprite
        if (direction > 0) _sprite.FlipH = false;
        if (direction < 0) _sprite.FlipH = true;

        // Jump logic - Smash style
        // Use _wasOnGround (state from previous frame) for jump detection
        if (Input.IsActionJustPressed("jump"))
        {
            if (_wasOnGround)
            {
                velocity.Y = JumpForce;
                _canDoubleJump = true;
            }
            else if (_canDoubleJump)
            {
                velocity.Y = JumpForce;
                _canDoubleJump = false;
                PlayAnimation("doublejump");
            }
        }

        // Reset on landing
        if (onGround && !_wasOnGround)
            _canDoubleJump = false;

        Velocity = velocity;
        MoveAndSlide();

        // Save ground state AFTER MoveAndSlide for next frame
        _wasOnGround = onGround;

        // Animations
        if (!onGround)
        {
            if (_currentAnimation != "mario/doublejump")
            {
                if (Velocity.Y < 0)
                    PlayAnimation("jump");
                else
                    PlayAnimation("fall");
            }
        }
        else
        {
            if (Mathf.Abs(Velocity.X) > 10f)
                PlayAnimation("run");
            else
                PlayAnimation("idle");
        }
    }
}
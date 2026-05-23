using Godot;

public partial class Character : CharacterBody2D
{
    [Export] public float Speed = 300f;
    [Export] public float JumpForce = -700f;
    [Export] public float Gravity = 1800f;

    private AnimationPlayer _animationPlayer;
    private Sprite2D _sprite;

    public override void _Ready()
    {
        _animationPlayer = GetNode<AnimationPlayer>("AnimationPlayer");
        _sprite = GetNode<Sprite2D>("Sprite2D");

        CargarAnimacionIdle();
    }

    private void CargarAnimacionIdle()
    {
        var library = new AnimationLibrary();
        var animation = new Animation();
        animation.Length = 16f / 30f; // 16 frames a 30fps
        animation.LoopMode = Animation.LoopModeEnum.Linear;

        int trackIndex = animation.AddTrack(Animation.TrackType.Value);
        animation.TrackSetPath(trackIndex, "Sprite2D:texture");

        for (int i = 0; i <= 15; i++)
        {
            string path = $"res://Assets/Sprites/Mario/Idle/";
            // Buscar el archivo que contenga "idle{i}"
            var dir = DirAccess.Open(path);
            if (dir != null)
            {
                dir.ListDirBegin();
                string fileName = dir.GetNext();
                while (fileName != "")
                {
                    if (fileName.Contains($"idle{i}") && fileName.EndsWith(".png"))
                    {
                        var texture = GD.Load<Texture2D>(path + fileName);
                        float time = i / 30f;
                        animation.TrackInsertKey(trackIndex, time, texture);
                        break;
                    }
                    fileName = dir.GetNext();
                }
            }
        }

        library.AddAnimation("idle", animation);
        _animationPlayer.AddAnimationLibrary("mario", library);
        _animationPlayer.Play("mario/idle");
    }

    public override void _PhysicsProcess(double delta)
    {
        Vector2 velocity = Velocity;

        if (!IsOnFloor())
            velocity.Y += Gravity * (float)delta;

        float direction = 0f;
        if (Input.IsActionPressed("ui_right")) direction += 1f;
        if (Input.IsActionPressed("ui_left")) direction -= 1f;
        velocity.X = direction * Speed;

        if (Input.IsActionJustPressed("ui_accept") && IsOnFloor())
            velocity.Y = JumpForce;

        Velocity = velocity;
        MoveAndSlide();
    }
}
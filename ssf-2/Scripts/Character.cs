using Godot;

public partial class Character : CharacterBody2D
{
    // Constantes de movimiento
    [Export] public float Speed = 300f;
    [Export] public float JumpForce = -700f;
    [Export] public float Gravity = 1800f;

    public override void _PhysicsProcess(double delta)
    {
        Vector2 velocity = Velocity;

        // Aplicar gravedad
        if (!IsOnFloor())
            velocity.Y += Gravity * (float)delta;

        // Movimiento horizontal
        float direction = 0f;
        if (Input.IsActionPressed("ui_right")) direction += 1f;
        if (Input.IsActionPressed("ui_left")) direction -= 1f;
        velocity.X = direction * Speed;

        // Saltar
        if (Input.IsActionJustPressed("ui_accept") && IsOnFloor())
            velocity.Y = JumpForce;

        Velocity = velocity;
        MoveAndSlide();
    }
}
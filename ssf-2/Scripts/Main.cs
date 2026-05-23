using Godot;

public partial class Main : Node
{
	public override void _Ready()
	{
		GD.Print("=== SSF2 C# Edition Initialized ===");
		GD.Print("Controls:");
		GD.Print("  Arrow Keys: Move");
		GD.Print("  Space/Up: Jump");
		GD.Print("  Z: Attack");
		GD.Print("  X: Special Attack");
		GD.Print("  C: Shield");
		GD.Print("  V: Grab");
	}
}

using Godot;

public partial class SetupInputActions : Node
{
	public static void EnsureInputActions()
	{
		if (!InputMap.HasAction("attack"))
		{
			InputMap.AddAction("attack");
			InputMap.ActionAddEvent("attack", CreateKeyEvent(Key.Z));
		}

		if (!InputMap.HasAction("special"))
		{
			InputMap.AddAction("special");
			InputMap.ActionAddEvent("special", CreateKeyEvent(Key.X));
		}

		if (!InputMap.HasAction("shield"))
		{
			InputMap.AddAction("shield");
			InputMap.ActionAddEvent("shield", CreateKeyEvent(Key.C));
		}

		if (!InputMap.HasAction("grab"))
		{
			InputMap.AddAction("grab");
			InputMap.ActionAddEvent("grab", CreateKeyEvent(Key.V));
		}
	}

	private static InputEvent CreateKeyEvent(Key keyCode)
	{
		var keyEvent = new InputEventKey();
		keyEvent.Keycode = keyCode;
		return keyEvent;
	}
}

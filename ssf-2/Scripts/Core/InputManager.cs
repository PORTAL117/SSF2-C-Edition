using Godot;

public class InputFrame
{
	public int FrameNumber { get; set; }
	public float HorizontalInput { get; set; }
	public float VerticalInput { get; set; }
	public bool AttackPressed { get; set; }
	public bool SpecialPressed { get; set; }
	public bool ShieldPressed { get; set; }
	public bool JumpPressed { get; set; }
	public bool GrabPressed { get; set; }

	public InputFrame()
	{
		HorizontalInput = 0f;
		VerticalInput = 0f;
	}

	public InputFrame Clone()
	{
		return new InputFrame
		{
			FrameNumber = FrameNumber,
			HorizontalInput = HorizontalInput,
			VerticalInput = VerticalInput,
			AttackPressed = AttackPressed,
			SpecialPressed = SpecialPressed,
			ShieldPressed = ShieldPressed,
			JumpPressed = JumpPressed,
			GrabPressed = GrabPressed
		};
	}
}

public partial class InputManager : Node
{
	private const float ANALOG_DEADZONE = 0.2f;
	private const int INPUT_BUFFER_SIZE = 300;

	private InputFrame[] _inputBuffer = new InputFrame[INPUT_BUFFER_SIZE];
	private int _currentFrame = 0;

	public override void _Ready()
	{
		for (int i = 0; i < INPUT_BUFFER_SIZE; i++)
		{
			_inputBuffer[i] = new InputFrame();
		}
	}

	public override void _Process(double delta)
	{
		CaptureInput();
	}

	private void CaptureInput()
	{
		var inputFrame = new InputFrame { FrameNumber = _currentFrame };

		// Horizontal movement
		float horizontal = 0f;
		if (Input.IsActionPressed("ui_right"))
			horizontal += 1f;
		if (Input.IsActionPressed("ui_left"))
			horizontal -= 1f;
		inputFrame.HorizontalInput = Mathf.Clamp(horizontal, -1f, 1f);

		// Vertical movement
		float vertical = 0f;
		if (Input.IsActionPressed("ui_down"))
			vertical += 1f;
		if (Input.IsActionPressed("ui_up"))
			vertical -= 1f;
		inputFrame.VerticalInput = Mathf.Clamp(vertical, -1f, 1f);

		// Actions
		inputFrame.JumpPressed = Input.IsActionJustPressed("ui_accept");
		inputFrame.AttackPressed = Input.IsActionJustPressed("attack");
		inputFrame.SpecialPressed = Input.IsActionJustPressed("special");
		inputFrame.ShieldPressed = Input.IsActionPressed("shield");
		inputFrame.GrabPressed = Input.IsActionJustPressed("grab");

		StoreInput(inputFrame);
		_currentFrame++;
	}

	private void StoreInput(InputFrame input)
	{
		int bufferIndex = _currentFrame % INPUT_BUFFER_SIZE;
		_inputBuffer[bufferIndex] = input;
	}

	public InputFrame GetInput(int frameNumber)
	{
		if (frameNumber < 0 || frameNumber >= _currentFrame)
			return new InputFrame();

		int bufferIndex = frameNumber % INPUT_BUFFER_SIZE;
		return _inputBuffer[bufferIndex].Clone();
	}

	public int GetCurrentFrame() => _currentFrame;
}

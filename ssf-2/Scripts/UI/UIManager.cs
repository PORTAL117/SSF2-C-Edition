using Godot;

public partial class UIManager : CanvasLayer
{
	private Label _player1NameLabel;
	private Label _player1DamageLabel;
	private Label _player1StocksLabel;

	private Label _player2NameLabel;
	private Label _player2DamageLabel;
	private Label _player2StocksLabel;

	private Label _timerLabel;
	private Label _frameCounterLabel;

	public override void _Ready()
	{
		CreateUI();
	}

	private void CreateUI()
	{
		var font = ThemeDB.FallbackFont;
		int fontSize = 32;

		// Left side UI (Player 1)
		_player1NameLabel = new Label();
		_player1NameLabel.Text = "Player 1";
		_player1NameLabel.Position = new Vector2(20, 20);
		_player1NameLabel.AddThemeFontSizeOverride("font_size", fontSize);
		AddChild(_player1NameLabel);

		_player1DamageLabel = new Label();
		_player1DamageLabel.Text = "0%";
		_player1DamageLabel.Position = new Vector2(20, 60);
		_player1DamageLabel.AddThemeFontSizeOverride("font_size", fontSize);
		AddChild(_player1DamageLabel);

		_player1StocksLabel = new Label();
		_player1StocksLabel.Text = "Stocks: 4";
		_player1StocksLabel.Position = new Vector2(20, 100);
		_player1StocksLabel.AddThemeFontSizeOverride("font_size", fontSize);
		AddChild(_player1StocksLabel);

		// Right side UI (Player 2)
		_player2NameLabel = new Label();
		_player2NameLabel.Text = "Player 2";
		_player2NameLabel.Position = new Vector2(1280 - 220, 20);
		_player2NameLabel.AddThemeFontSizeOverride("font_size", fontSize);
		_player2NameLabel.AddThemeColorOverride("font_color", Colors.SteelBlue);
		AddChild(_player2NameLabel);

		_player2DamageLabel = new Label();
		_player2DamageLabel.Text = "0%";
		_player2DamageLabel.Position = new Vector2(1280 - 220, 60);
		_player2DamageLabel.AddThemeFontSizeOverride("font_size", fontSize);
		AddChild(_player2DamageLabel);

		_player2StocksLabel = new Label();
		_player2StocksLabel.Text = "Stocks: 4";
		_player2StocksLabel.Position = new Vector2(1280 - 220, 100);
		_player2StocksLabel.AddThemeFontSizeOverride("font_size", fontSize);
		AddChild(_player2StocksLabel);

		// Center timer
		_timerLabel = new Label();
		_timerLabel.Text = "5:00";
		_timerLabel.Position = new Vector2(640 - 50, 20);
		_timerLabel.AddThemeFontSizeOverride("font_size", fontSize);
		AddChild(_timerLabel);

		// Frame counter (debug)
		_frameCounterLabel = new Label();
		_frameCounterLabel.Text = "Frame: 0";
		_frameCounterLabel.Position = new Vector2(20, 680);
		_frameCounterLabel.AddThemeFontSizeOverride("font_size", 20);
		AddChild(_frameCounterLabel);
	}

	public void UpdateUI(Character player1, Character player2, int frameNumber)
	{
		if (player1 != null && _player1DamageLabel != null)
		{
			_player1DamageLabel.Text = $"{player1.GetDamagePercent()}%";
			_player1StocksLabel.Text = $"Stocks: {player1.GetStocks()}";
			_player1NameLabel.Text = player1.CharacterName;
		}

		if (player2 != null && _player2DamageLabel != null)
		{
			_player2DamageLabel.Text = $"{player2.GetDamagePercent()}%";
			_player2StocksLabel.Text = $"Stocks: {player2.GetStocks()}";
			_player2NameLabel.Text = player2.CharacterName;
		}

		if (_frameCounterLabel != null)
		{
			_frameCounterLabel.Text = $"Frame: {frameNumber}";
		}
	}
}

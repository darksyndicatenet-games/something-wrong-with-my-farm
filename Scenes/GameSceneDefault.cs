using Godot;
using System;

public partial class GameSceneDefault : Node2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
		//GD.Print("Slay");

	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		
		if (Input.IsActionJustPressed("ui_cancel"))
		{
			GD.Print("Slay");
			 GetTree().Quit();
		}
	}
}

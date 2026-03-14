using Godot;
using System;

public partial class PetSpawner : Node2D
{
	[Export] public Node2D EvilCat;
	[Export] public Node2D Bunny;
	[Export] public Area2D AreaSpawn;
	[Export] public Timer SpawnTimer;

	Random random = new Random();

	public override void _Ready()
	{
		// Connect the timer signal
		SpawnTimer.Timeout += OnSpawnTimerTimeout;
		SpawnTimer.Start(); // Make sure the timer is running
	}

	private void OnSpawnTimerTimeout()
	{
		// Hide both pets first
		EvilCat.Visible = false;
		Bunny.Visible = false;

		// Randomly pick one pet
		Node2D pet = random.Next(2) == 0 ? EvilCat : Bunny;

		// Place it randomly inside the AreaSpawn
		pet.GlobalPosition = GetRandomPointInArea();

		// Show the selected pet
		pet.Visible = true;
	}

	private Vector2 GetRandomPointInArea()
	{
		CollisionShape2D shape = AreaSpawn.GetNode<CollisionShape2D>("CollisionShape2D");
		RectangleShape2D rect = shape.Shape as RectangleShape2D;

		Vector2 extents = rect.Size / 2;

		float x = (float)(random.NextDouble() * rect.Size.X - extents.X);
		float y = (float)(random.NextDouble() * rect.Size.Y - extents.Y);

		return AreaSpawn.GlobalPosition + new Vector2(x, y);
	}
}

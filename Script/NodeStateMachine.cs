using Godot;
using System;

public partial class NodeStateMachine : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	
	  public virtual void OnProcess(double delta)
	{
	}

	public virtual void OnPhysicsProcess(double delta)
	{
	}

	public virtual void OnNextTransitions()
	{
	}

	public virtual void OnEnter()
	{
	}

	public virtual void OnExit()
	{
	}
}

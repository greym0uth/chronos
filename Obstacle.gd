extends Node2D

export(float) var current_dialation = 1.0

func _ready():
  $AnimationPlayer.playback_speed = current_dialation
  $AnimationPlayer.play("obstacle_animate")

func dialate(modifier: float):
  current_dialation = modifier
  $AnimationPlayer.playback_speed = current_dialation

func reset():
  current_dialation = 1.0
  $AnimationPlayer.playback_speed = current_dialation

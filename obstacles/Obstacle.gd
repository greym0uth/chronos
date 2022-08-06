extends Node2D
class_name Obstacle

export(float) var current_dialation = 1.0
export(float) var start_offset = 0.0

func _ready():
  $AnimationPlayer.playback_speed = current_dialation
  $AnimationPlayer.play("obstacle_animate")
  $AnimationPlayer.seek(start_offset)

func dialate(modifier: float):
  current_dialation -= modifier
  $AnimationPlayer.playback_speed = current_dialation

func reset():
  current_dialation = 1.0
  $AnimationPlayer.playback_speed = current_dialation

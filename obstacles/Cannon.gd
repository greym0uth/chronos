tool
extends "res://obstacles/Obstacle.gd"

export(float) var distance = 400.0
export(float) var duration = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
  if !Engine.editor_hint:
    var start_position = $Cannonball.position
    var end_position = start_position + Vector2(-distance, 0)
    $Tween.interpolate_property($Cannonball, "position", start_position, end_position, duration)
    $Tween.start()
  
func dialate(modifier: float):
  .dialate(modifier)
  $Tween.playback_speed = modifier

func reset():
  .reset()
  $Tween.playback_speed = 1.0


func _draw():
  if Engine.editor_hint:
    var end_position = $Cannonball.position + Vector2(-distance, 0)
    draw_line($Cannonball.position, end_position, Color.red)
    draw_line(end_position - Vector2(0, 10.0), end_position + Vector2(0, 10.0), Color.red)

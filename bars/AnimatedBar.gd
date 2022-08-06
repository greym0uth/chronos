tool
extends Node2D

export(float) var distance = 400.0
export(float) var duration = 4.0
export(float) var start_offset = 0.0

var forward = true

# Called when the node enters the scene tree for the first time.
func _ready():
  if !Engine.editor_hint:
    print(self)
    print(start_offset)
    reverse(start_offset)

func reverse(delay: float = 0):
  var start_position = $Bar.position
  var direction_modifier = -1 if forward else 1
  var end_position = start_position + Vector2(0, distance * direction_modifier)
  $Tween.interpolate_property($Bar, "position", start_position, end_position, duration, 4, 2, delay)
  $Tween.start()
  forward = !forward
  
func dialate(modifier: float):
  $Tween.playback_speed = modifier

func reset():
  $Tween.playback_speed = 1.0

func _draw():
  if Engine.editor_hint:
    var end_position = $Bar.position + Vector2(0, -distance)
    var center_offset = Vector2(400.0, 0)
    draw_line($Bar.position + center_offset, end_position + center_offset, Color.red)
    draw_line(end_position + center_offset - Vector2(10.0, 0), end_position + center_offset + Vector2(10.0, 0), Color.red)


func _on_tween_completed(_object:Object, _key:NodePath):
  reverse(0.0)

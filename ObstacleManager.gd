extends Node2D

func _on_Box_start_dialation():
  for obstacle in get_children():
    obstacle.dialate(0.1)

func _on_Box_end_dialation():
  for obstacle in get_children():
    obstacle.reset()

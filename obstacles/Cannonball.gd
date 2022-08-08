extends Area2D

const Box = preload("res://Box.gd")

func _on_body_entered(body:Node):
  if body is Box:
    body.gameover()

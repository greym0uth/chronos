extends Node2D

export(int) var count = 50
export(float) var bar_width = 800.0

export(PackedScene) var base_bar

func _ready():
  for i in count:
    var bar = base_bar.instance()
    bar.position.x += bar_width * i
    add_child(bar)

tool
extends Node2D

class_name Bars

export(Array, PackedScene) var bars setget _set_bars
export(float) var bar_width = 800.0

export(PackedScene) var base_bar = preload("res://bars/Bar.tscn")

func _set_bars(new_bars: Array):
  print(new_bars)
  bars = new_bars
  for n in get_children():
    remove_child(n)
    n.queue_free()

  for i in bars.size():
    print(i)
    var bar_scn = bars[i]
    var bar = base_bar.instance() if bar_scn == null else bar_scn.instance()
    bar.position.x += bar_width * i
    add_child(bar)

func _draw():
  if Engine.editor_hint:
    for i in bars.size() * 4:
      var is_first = i % 4 == 0
      var height = -400 if is_first else -100
      draw_line(Vector2(i * (bar_width / 4), 0.0), Vector2(i * (bar_width / 4), height), Color.blueviolet)
      if is_first:
        draw_string(Label.new().get_font(""), Vector2(i * (bar_width / 4) + 10.0, -10.0), String(i / 4 + 1), Color.black)

extends PanelContainer

signal back_pressed

func _on_Back_pressed():
  emit_signal("back_pressed")

func _on_Volume_value_changed(value: float):
  AudioServer.set_bus_volume_db(0, value - 80)
  print(value)

extends Node2D

signal play_pressed

export(PackedScene) var level: PackedScene

onready var MainMenu = get_node("CanvasLayer/Control/Main")
onready var Settings = get_node("CanvasLayer/Control/Settings")

# Called when the node enters the scene tree for the first time.
func _ready():
  $AnimationPlayer.play("move")

func _on_Controls_pressed():
  MainMenu.hide()
  Settings.show()

func _on_Settings_back_pressed():
  Settings.hide()
  MainMenu.show()

func _on_Play_pressed():
  if level != null:
    get_tree().change_scene_to(level)
  emit_signal("play_pressed")

func _on_Quit_pressed():
  get_tree().quit()

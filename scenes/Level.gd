extends Node2D

onready var PauseMenu = get_node("CanvasLayer/Control/Pause")
onready var SettingsMenu = get_node("CanvasLayer/Control/Settings")
onready var GameOverMenu = get_node("CanvasLayer/Control/GameOver")
onready var WinnerMenu = get_node("CanvasLayer/Control/Winner")

func _ready():
  get_tree().paused = false

func _process(_delta):
  if Input.is_action_just_pressed("pause"):
    get_tree().paused = true
    PauseMenu.show();

func _on_Resume_pressed():
  PauseMenu.hide()
  get_tree().paused = false

func _on_Settings_pressed():
  PauseMenu.hide()
  SettingsMenu.show()

func _on_Settings_back_pressed():
  SettingsMenu.hide();
  PauseMenu.show()

func _on_Reset_pressed():
  get_tree().reload_current_scene()

func _on_Quit_pressed():
  get_tree().change_scene("res://scenes/Title.tscn")

func _on_game_over():
  get_tree().paused = true
  GameOverMenu.show()

func _on_finish(_body):
  get_tree().paused = true
  WinnerMenu.show()

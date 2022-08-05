extends KinematicBody2D

signal game_over

signal start_dialation
signal end_dialation

export(float) var gravity = 1600.0
export(float) var jump_power = 700.0

export(int) var bpm = 150
export(int) var units_per_beat = 200
export(float) var speed_modifier = 1.0

var velocity = Vector2()

onready var speed = (bpm as float / 60.0) * units_per_beat as float
onready var Animator: AnimationPlayer = get_node("AnimationPlayer")

func _physics_process(delta):
  velocity.x = speed * speed_modifier
  var gravity_multiplier = 0.5 if velocity.y > 0 else 1.0
  velocity.y += delta * gravity * gravity_multiplier

  if is_on_floor() && Input.is_action_just_pressed("jump"):
    velocity.y = -jump_power
    Animator.play("jump")

  velocity = move_and_slide(velocity, Vector2.UP)
  
  if velocity.x < speed / 2:
    emit_signal("game_over")

func _process(_delta):
  if Input.is_action_just_pressed("dialate"):
    emit_signal("start_dialation")
  if Input.is_action_just_released("dialate"):
    emit_signal("end_dialation")

extends KinematicBody2D

signal game_over

signal start_dialation
signal end_dialation
signal dialation_depleted
signal dialation_recovered
signal dialation_meter_changed

export(float) var gravity = 1600.0
export(float) var jump_power = 700.0

export(int) var bpm = 150
export(int) var units_per_beat = 200
export(float) var speed_modifier = 1.0

export(float) var dialation_decay = 20.0
export(float) var dialation_recovery = 10.0

var velocity = Vector2()
var dialation_active = false
var dialation_meter = 100.0
var dialation_depleted = false

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
  
  if velocity.x < speed / 2 || position.y > 50:
    emit_signal("game_over")

func _process(delta):
  if dialation_active:
    dialation_meter -= dialation_decay * delta
    if dialation_meter < 0:
      dialation_meter = 0
      
    emit_signal("dialation_meter_changed", dialation_meter)

    if dialation_meter <= 0:
      dialation_depleted = true
      emit_signal("dialation_depleted")
      emit_signal("end_dialation")
      dialation_active = false
    elif Input.is_action_just_released("dialate"):
      emit_signal("end_dialation")
      dialation_active = false
      
  else:
    if dialation_meter < 100:
      dialation_meter += dialation_recovery * delta
      if dialation_meter > 100:
        dialation_meter = 100.0
      
      emit_signal("dialation_meter_changed", dialation_meter)

    if dialation_depleted && dialation_meter > 25:
      dialation_depleted = false
      emit_signal("dialation_recovered")

  if Input.is_action_just_pressed("dialate") && !dialation_depleted:
    emit_signal("start_dialation")
    dialation_active = true

func gameover():
  emit_signal("game_over")
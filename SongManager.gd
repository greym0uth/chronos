extends Node2D

export(AudioStream) var song

func _ready():
  $BaseSongPlayer.stream = song
  $SlowSongPlayer.stream = song
  AudioServer.set_bus_bypass_effects(1, true)

func _on_song_started(_body):
  $BaseSongPlayer.play()

func _on_start_dialation():
  AudioServer.set_bus_bypass_effects(1, false)
  $AnimationPlayer.play("dialate")

func _on_end_dialation():
  AudioServer.set_bus_bypass_effects(1, true)
  $AnimationPlayer.play("undialate")

func play_dialation_track():
  var song_position = $BaseSongPlayer.get_playback_position()
  $SlowSongPlayer.play(song_position)

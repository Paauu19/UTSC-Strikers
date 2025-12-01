extends RefCounted
class_name Screen

signal screen_transition_requested(new_screen: SoccerGame.ScreenType, data: ScreenData)

@export var music: String # Cambiado a String si no tienes el enum MusicPlayer.Music

var game : SoccerGame = null
var screen_data : ScreenData = null

func setup(context_game: SoccerGame, context_data: ScreenData) -> void:
	game = context_game
	screen_data = context_data

func transition_screen(new_screen: SoccerGame.ScreenType, data: ScreenData = null) -> void:
	if data == null:
		data = screen_data  # Reutiliza el contexto actual
	screen_transition_requested.emit(new_screen, data)

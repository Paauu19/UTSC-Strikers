extends RefCounted
class_name ScreenData

var tournament = null
var mode: String = ""
var quiz_theme: String = "" # Usaremos esto para indicar qué quiz cargar

static func build() -> ScreenData:
	return ScreenData.new()

func set_mode(game_mode: String) -> ScreenData:
	mode = game_mode
	return self

func set_quiz_theme(theme: String) -> ScreenData:
	quiz_theme = theme
	return self

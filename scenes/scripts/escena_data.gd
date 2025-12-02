extends RefCounted
class_name ScreenData

var tournament = null
var mode: String = ""
var quiz_theme: String = ""
var quiz_mode: String = ""         # 👈 agregado
var question_count: int = 0        # 👈 agregado

static func build() -> ScreenData:
	return ScreenData.new()

func set_mode(game_mode: String) -> ScreenData:
	mode = game_mode
	return self

func set_quiz_theme(theme: String) -> ScreenData:
	quiz_theme = theme
	return self

func set_quiz_mode(mode_name: String) -> ScreenData:   # 👈 nuevo setter
	quiz_mode = mode_name
	return self

func set_question_count(count: int) -> ScreenData:     # 👈 nuevo setter
	question_count = count
	return self

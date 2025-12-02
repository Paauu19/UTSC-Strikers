extends RefCounted
class_name ScreenFactory

var screens := {
	SoccerGame.ScreenType.MAIN_MENU: preload("res://scenes/scenes/screens/main_menu/menu_principal.tscn"),
	SoccerGame.ScreenType.CONTROLS: preload("res://scenes/scenes/screens/main_menu/controls.tscn"),
	SoccerGame.ScreenType.ABOUT: preload("res://scenes/scenes/screens/main_menu/about.tscn"),
	SoccerGame.ScreenType.QUIZ_MODE_SELECTION: preload("res://scenes/scenes/screens/main_menu/modo_quiz_select.tscn"),
	SoccerGame.ScreenType.THERMOWATCH_QUIZ: preload("res://scenes/scenes/thermowatch_quiz.tscn"),
	SoccerGame.ScreenType.SOCCER_QUIZ: preload("res://scenes/scenes/soccer_quiz.tscn"),
	SoccerGame.ScreenType.MIXED_QUIZ: preload("res://scenes/scenes/mixed_quiz.tscn"),
}

func get_fresh_screen(screen: SoccerGame.ScreenType) -> Screen:
	if not screens.has(screen):
		push_error("❌ Screen no registrada: " + str(screen))
		return null

	var instance = screens[screen].instantiate()

	if instance is Screen:
		return instance
	else:
		push_error("❌ La escena no extiende de Screen: " + str(screen))
		return null

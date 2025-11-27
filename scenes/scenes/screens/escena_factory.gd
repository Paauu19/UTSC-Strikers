extends RefCounted
class_name ScreenFactory

var screens : Dictionary

func _init() -> void:
	screens = {
		# --- PANTALLAS PRINCIPALES ---
		# Usamos las rutas que asumimos son las correctas:
		SoccerGame.ScreenType.MAIN_MENU: preload("res://scenes/scenes/menu_principal.tscn"),
		# Añadir una pantalla de controles o la reemplazamos por el Quiz Selector
		SoccerGame.ScreenType.CONTROLS: preload("res://scenes/scenes/controls.gd"),
		SoccerGame.ScreenType.ABOUT: preload("res://scenes/scenes/controls.gd"), # Necesitas crear esta escena
		
		# --- PANTALLAS DE QUIZ ---
		# Pantalla intermedia de selección de Quiz (Nueva)
		SoccerGame.ScreenType.QUIZ_MODE_SELECTION: preload("res://scenes/scenes/modo_quiz_select.tscn"), 
		# Quizes específicos
		SoccerGame.ScreenType.THERMOWATCH_QUIZ: preload("res://scenes/screens/quiz/project_quiz_screen.tscn"),
		SoccerGame.ScreenType.SOCCER_QUIZ: preload("res://scenes/screens/quiz/soccer_quiz_screen.tscn"),
		SoccerGame.ScreenType.TEST_QUIZ: preload("res://scenes/screens/quiz/animals_quiz_screen.tscn") # Usaremos esta como "TEST QUIZ"
	}

func get_fresh_screen(screen: SoccerGame.ScreenType) -> Screen:
	if not screens.has(screen):
		push_error("ScreenFactory: La pantalla solicitada no existe en el diccionario: " + str(screen))
		return null
	return screens.get(screen).instantiate()

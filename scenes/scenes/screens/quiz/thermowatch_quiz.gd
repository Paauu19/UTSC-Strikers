extends QuizGame
class_name ThermoWatchQuizScreen

func select_theme_mode() -> void:
	# Carga las 20 preguntas del THERMOWATCH_QUIZ
	if ALL_QUIZ_DATA.has("THERMOWATCH_QUIZ"):
		var pool = ALL_QUIZ_DATA["THERMOWATCH_QUIZ"].duplicate()
		current_questions_set = pool
		print("🌡️ Modo THERMOWATCH QUIZ Activado (%d Preguntas)" % current_questions_set.size())
	else:
		push_error("❌ ERROR: No se encontró la data de THERMOWATCH_QUIZ.")

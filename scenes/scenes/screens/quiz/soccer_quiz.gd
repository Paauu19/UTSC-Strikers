extends QuizGame
class_name SoccerQuizScreen

func select_theme_mode() -> void:
	# Carga las 20 preguntas del SOCCER_QUIZ
	if ALL_QUIZ_DATA.has("SOCCER_QUIZ"):
		var pool = ALL_QUIZ_DATA["SOCCER_QUIZ"].duplicate()
		current_questions_set = pool
		print("⚽ Modo SOCCER QUIZ Activado (%d Preguntas)" % current_questions_set.size())
	else:
		push_error("❌ ERROR: No se encontró la data de SOCCER_QUIZ.")

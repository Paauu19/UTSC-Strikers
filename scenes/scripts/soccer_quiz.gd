extends QuizGame
class_name SoccerQuizScreen  # Cambiar según corresponda: MixedQuizScreen, ThermoWatchQuizScreen

# --- CONFIGURAR EL QUIZ CON DATOS EXTERNOS ---
func setup_quiz_data(data: ScreenData) -> void:
	quiz_mode = data.quiz_mode
	question_count = data.question_count if data.question_count > 0 else ALL_QUIZ_DATA[get_quiz_key()].size()
	select_theme_mode()
	# Inicializar el quiz
	setup_quiz(get_quiz_key())

# --- DEVOLVER LA CLAVE DEL QUIZ ---
func get_quiz_key() -> String:
	match quiz_mode:
		"soccer":
			return "SOCCER_QUIZ"
		"mixed":
			return "MIXED_QUIZ"
		"thermowatch":
			return "THERMOWATCH_QUIZ"
		_:
			push_error("Modo de quiz desconocido: %s" % quiz_mode)
			return "MIXED_QUIZ"

# --- INICIALIZAR MODO TEMÁTICO ---
func select_theme_mode() -> void:
	var key = get_quiz_key()
	if ALL_QUIZ_DATA.has(key):
		print("⚽ Inicializando Modo %s." % key)
	else:
		push_error("❌ No se encontró la data del quiz: %s" % key)

extends Screen
class_name SoccerQuizScreen # Cambiar según corresponda: MixedQuizScreen, ThermoWatchQuizScreen

# --- CONSTANTES ---
const POINTS_PER_CORRECT_ANSWER := 10
const COLOR_CORRECT = Color(0, 1, 0, 0.6) # Verde semi-transparente (Alpha = 0.6)
const COLOR_INCORRECT = Color(1, 0, 0, 0.6) # Rojo semi-transparente (Alpha = 0.6)
const DAMAGE_PER_INCORRECT_ANSWER: float = 0.3333333 # Para restar 1/3 de vida

# ❤️ TEXTURAS DE VIDA
const TEXTURE_HEART_FULL = preload("res://assets/ui/PNG/Quiz/heart_full.tres")
const TEXTURE_HEART_SEMIFULL = preload("res://assets/ui/PNG/Quiz/heart_semifull.tres")
const TEXTURE_HEART_SEMIEMPTY = preload("res://assets/ui/PNG/Quiz/heart_semiempty.tres")
const TEXTURE_HEART_EMPTY = preload("res://assets/ui/PNG/Quiz/heart_empty.tres")

# 🎯 Todas las preguntas del quiz (Se usa el key del modo: "soccer", "mixed", "thermowatch")
const ALL_QUIZ_DATA = {
	"soccer": [ # ✅ CLAVE AJUSTADA a "soccer" para coincidir con ScreenData
	{ "text": "1.¿Cuántos jugadores por equipo \nestán en el campo \ndurante un partido?", "options": ["10 jugadores", "11 jugadores", "9 jugadores", "12 jugadores"], "correct": 1, "theme": "SOCCER" },
	{ "text": "2.¿Cuánto dura un tiempo \nreglamentario de fútbol?", "options": ["30 minutos", "45 minutos", "60 minutos", "90 minutos"], "correct": 1, "theme": "SOCCER" },
	{ "text": "3.¿Qué tarjeta se utiliza \npara expulsar a un \njugador del campo?", "options": ["Tarjeta Verde", "Tarjeta \nAzul", "Tarjeta \nAmarilla", "Tarjeta \nRoja"], "correct": 3, "theme": "SOCCER" },
	{ "text": "4.¿Desde qué distancia \nse lanza un penal?", "options": ["12 metros", "11 metros", "9 metros", "15 metros"], "correct": 1, "theme": "SOCCER" },
	{ "text": "5.¿Qué significa \nla sigla VAR?", "options": ["Visual \nAssistance \nReview", "Video \nAction \nReferee", "Video \nAssistant \nReferee", "Vertical \nArea \nReview"], "correct": 2, "theme": "SOCCER" },
	{ "text": "6.¿Qué país ganó el Mundial de Fútbol masculino en 2022?", "options": ["Francia", "Brasil", "Alemania", "Argentina"], "correct": 3, "theme": "SOCCER" },
	{ "text": "7.¿Qué jugador es conocido \ncomo 'La Pulga'?", "options": ["Cristiano \nRonaldo", "Neymar \nJr.", "Kylian \nMbappé", "Lionel \nMessi"], "correct": 3, "theme": "SOCCER" },
	{ "text": "8.¿Quién es el \nportero de la Selección \nde Argentina (2022)?", "options": ["Franco \nArmani", "Emiliano \nMartínez", "Geronimo \nRulli", "Damián \nMartínez"], "correct": 1, "theme": "SOCCER" },
	{ "text": "9.¿Qué posición juega \nHarry Kane?", "options": ["Defensa \ncentral", "Portero", "Delantero", "Mediocampista"], "correct": 2, "theme": "SOCCER" },
	{ "text": "10. ¿En qué país juega \nla mayoría de los jugadores \nde la selección de España?", "options": ["Alemania", "Francia", "España", "Inglaterra"], "correct": 2, "theme": "SOCCER" },
	{ "text": "11. ¿Dónde se celebró \nel Mundial Femenino \nde 2023?", "options": ["EE. UU.", "Australia y \nNueva Zelanda", "Francia", "Canadá"], "correct": 1, "theme": "SOCCER" },
	{ "text": "12. ¿Qué país es \nla sede principal \ndel Mundial 2026?", "options": ["Canadá", "México", "Estados \nUnidos", "Brasil"], "correct": 2, "theme": "SOCCER" },
	{ "text": "13. ¿Cuál es el rol \nprincipal de un \nMediocampista?", "options": ["Evitar \ngoles", "Defender y atacar, \ncrear juego", "Anotar la mayoría \nde los goles", "Lanzar el \nbalón"], "correct": 1, "theme": "SOCCER" },
	{ "text": "14. ¿Qué jugador tiene el \nrécord de más Balones \nde Oro ganados?", "options": ["Lionel \nMessi", "Cristiano \nRonaldo", "Pelé", "Maradona"], "correct": 0, "theme": "SOCCER" },
	{ "text": "15. ¿Cuál es el nombre \ndel estadio que será sede de \nla final del Mundial 2026?", "options": ["Estadio \nAzteca \n(México)", "MetLife \nStadium \n(Nueva York/NJ)", "SoFi \nStadium \n(Los Ángeles)", "BC Place \n(Canadá)"], "correct": 1, "theme": "SOCCER" },
	{ "text": "16. ¿En qué año se \ncelebró el primer \nMundial de Fútbol?", "options": ["1930", "1950", "1966", "1900"], "correct": 0, "theme": "SOCCER" },
	{ "text": "17. ¿Qué país tiene \nmás títulos de la Copa \ndel Mundo (masculino)?", "options": ["Alemania", "Italia", "Brasil", "Argentina"], "correct": 2, "theme": "SOCCER" },
	{ "text": "18. ¿Cuál es el \nprincipal rol de un \nDefensa Central?", "options": ["Marcar goles \ny asistir", "Crear juego en \nel mediocampo", "Proteger la portería \ny despejar balones", "Correr por las \nbandas y centrar"], "correct": 2, "theme": "SOCCER" },
	{ "text": "19. ¿Qué se señala cuando \nel balón cruza la \nlínea lateral completamente?", "options": ["Saque de \nesquina (corner)", "Saque de \nmeta (portería)", "Saque de \nbanda", "Falta \ndirecta"], "correct": 2, "theme": "SOCCER" },
	{ "text": "20. ¿Cuántos Mundiales Femeninos \nha ganado la selección \nde Estados Unidos?", "options": ["Dos", "Cuatro", "Tres", "Cinco"], "correct": 1, "theme": "SOCCER" }
	]
	# Deberías añadir las otras claves "mixed" y "thermowatch" aquí si existieran
}

# --- NODOS UI ---
@onready var label_question: Label = $FondoCampo/Label
@onready var option_buttons: Array[Button] = [
	$FondoCampo/BotonOpcion1,
	$FondoCampo/BotonOpcion2,
	$FondoCampo/BotonOpcion3,
	$FondoCampo/BotonOpcion4
]
@onready var option_labels: Array[Label] = [
	$FondoCampo/BotonOpcion1/LabelBotonOpcion1,
	$FondoCampo/BotonOpcion2/LabelBotonOpcion2,
	$FondoCampo/BotonOpcion3/LabelBotonOpcion3,
	$FondoCampo/BotonOpcion4/LabelBotonOpcion4
]
@onready var option_backgrounds: Array[ColorRect] = [
	$FondoCampo/BotonOpcion1/ColorRect,
	$FondoCampo/BotonOpcion2/ColorRect,
	$FondoCampo/BotonOpcion3/ColorRect,
	$FondoCampo/BotonOpcion4/ColorRect
]
@onready var hearts_ui: Array[TextureRect] = [
	$FondoCampo/HeartsContainer/HeartTextureRect,
	$FondoCampo/HeartsContainer/HeartTextureRect2,
	$FondoCampo/HeartsContainer/HeartTextureRect3
]
@onready var boton_volver_menu: Button = $FondoCampo/BotonVolver
# ✅ NUEVO: Referencia al Label dentro de StatsContent
@onready var label_stats: Label = $FondoCampo/StatsContent/StatsContentLabel 

# --- VARIABLES ---
var current_questions_set: Array = []
var current_round := 0
var score := 0
var lives: float = 3.0
var is_waiting_for_answer := false
var is_game_over := false
var quiz_mode_key: String = "soccer" # Clave predeterminada
var max_questions: int = -1 # -1 significa todas las preguntas

# ✅ SOBREESCRIBIR SETUP PARA RECIBIR DATOS
func setup(game: SoccerGame, data: ScreenData) -> void:
	super.setup(game, data)
	if data:
		quiz_mode_key = data.quiz_mode
		max_questions = data.question_count
	else:
		push_warning("ScreenData es null. Usando configuración predeterminada.")

func _ready() -> void:
	boton_volver_menu.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.MAIN_MENU)
	)
	# ✅ LLAMAR setup_quiz AQUÍ para usar las variables actualizadas
	setup_quiz()
	for i in range(option_buttons.size()):
		option_buttons[i].pressed.connect(on_answer_submitted.bind(i))

# ✅ CAMBIO CLAVE: setup_quiz ahora usa las variables de clase (actualizadas por setup())
func setup_quiz() -> void:
	if not ALL_QUIZ_DATA.has(quiz_mode_key):
		push_error("No se encontró la data del quiz para el modo: %s" % quiz_mode_key)
		return
		
	# 1. Obtener todas las preguntas
	var all_questions = ALL_QUIZ_DATA[quiz_mode_key].duplicate(true)
	all_questions.shuffle()
	
	# 2. Limitar el número de preguntas si es necesario
	# Nota: la función slice toma el índice inicial y final (exclusivo), 
	# si es max_questions > 0, usamos max_questions.
	if max_questions > 0 and max_questions < all_questions.size():
		# Usar max_questions para tomar hasta ese índice (ej: 0 a 4 para 5 preguntas)
		current_questions_set = all_questions.slice(0, max_questions) 
	else:
		current_questions_set = all_questions
	
	# Llamar a _update_stats_label después de definir current_questions_set
	_update_stats_label() 
		
	_shuffle_options()
	update_hearts_display()
	start_round()

func _shuffle_options() -> void:
	for i in range(current_questions_set.size()):
		var q = current_questions_set[i].duplicate(true)
		var options = q["options"].duplicate()
		var correct_text = options[q["correct"]]
		options.shuffle()
		q["options"] = options
		q["correct"] = options.find(correct_text)
		current_questions_set[i] = q

# --- LÓGICA DEL QUIZ ---
func start_round() -> void:
	if is_game_over: return
	# ✅ Usar current_questions_set.size() para el límite
	if current_round >= current_questions_set.size():
		finish_quiz()
		return
	is_waiting_for_answer = true
	var q = current_questions_set[current_round]
	label_question.text = q.get("text", "Sin pregunta")
	for i in range(option_buttons.size()):
		var btn = option_buttons[i]
		var lbl = option_labels[i]
		
		# 1. OCULTAR EL COLORRECT al inicio
		option_backgrounds[i].visible = false 
		
		if i < q["options"].size():
			lbl.text = q["options"][i]
			lbl.remove_theme_color_override("font_color")
			
			# 2. Resetea el color del botón (modulate) a blanco/normal (opacidad 1.0)
			btn.modulate = Color(1, 1, 1, 1.0)
			
			btn.disabled = false
			# Mantenemos visible el botón padre
			btn.visible = true 
		else:
			btn.visible = true 

func on_answer_submitted(selected_index: int) -> void:
	if not is_waiting_for_answer or is_game_over: return
	is_waiting_for_answer = false
	var q = current_questions_set[current_round]
	var correct_index = q["correct"]
	for btn in option_buttons:
		# ✅ CORRECCIÓN CRÍTICA: Deshabilita la interacción después de cualquier respuesta
		btn.disabled = false
	if selected_index == correct_index:
		handle_correct_answer(selected_index)
	else:
		handle_incorrect_answer(selected_index, correct_index)

func handle_correct_answer(index: int) -> void:
	score += POINTS_PER_CORRECT_ANSWER
	
	# 1. Hacemos el ColorRect visible
	option_backgrounds[index].visible = true 
	# 2. Le damos el color VERDE semi-transparente
	option_backgrounds[index].color = COLOR_CORRECT
	
	# ✅ IMPORTANTE: La ronda SOLO AVANZA aquí
	current_round += 1
	_update_stats_label() # Se actualizan las estadísticas CON la nueva ronda
	
	get_tree().create_timer(1.5).timeout.connect(start_round)

func handle_incorrect_answer(selected_index: int, correct_index: int) -> void:
	# Aplicar daño de 1/3 de vida y redondear
	lives = max(0.0, round((lives - DAMAGE_PER_INCORRECT_ANSWER) * 100.0) / 100.0)
	update_hearts_display()
	
	# ROJO para la seleccionada
	option_backgrounds[selected_index].visible = true
	option_backgrounds[selected_index].color = COLOR_INCORRECT 

	# VERDE para la correcta
	option_backgrounds[correct_index].visible = true
	option_backgrounds[correct_index].color = COLOR_CORRECT 
	
	# ✅ La ronda NO AVANZA aquí, pero la etiqueta se actualiza para reflejar el intento
	_update_stats_label()

	if lives <= 0:
		is_game_over = true
		get_tree().create_timer(2.5).timeout.connect(func():
			transition_screen(SoccerGame.ScreenType.MAIN_MENU)
		)
	else:
		get_tree().create_timer(1.5).timeout.connect(func():
			for i in range(option_buttons.size()):
				option_labels[i].remove_theme_color_override("font_color")
				
				# Resetea el color del botón (modulate)
				option_buttons[i].modulate = Color(1, 1, 1, 1.0)
				
				# Oculta el ColorRect de nuevo
				option_backgrounds[i].visible = false
				
				# Vuelve a habilitar el botón padre para el reintento de la misma ronda
				option_buttons[i].disabled = false 
			is_waiting_for_answer = true
		)

# --- FUNCIÓN DE UTILIDAD PARA ESTADÍSTICAS ---
func _update_stats_label() -> void:
	var total_questions = current_questions_set.size()
	
	# Mostrar el número de ronda actual (current_round) en relación al total. 
	# Usamos current_round + 1 para mostrar el número de pregunta actual (1-based index)
	var current_question_number = min(current_round + 1, total_questions)

	# El texto que se mostrará en el StatsContentLabel
	label_stats.text = "PUNTOS\n%d\nRONDA\n%d / %d" % [
		score,
		current_question_number,
		total_questions
	]


func update_hearts_display() -> void:
	var remaining = lives
	for i in range(hearts_ui.size()):
		var fraction = clamp(remaining, 0.0, 1.0)

		if fraction > 0.66:
			# ❤️ Llena completamente
			hearts_ui[i].texture = TEXTURE_HEART_FULL
		elif fraction > 0.33:
			# 💖 Semilleno
			hearts_ui[i].texture = TEXTURE_HEART_SEMIFULL
		elif fraction > 0.0:
			# 💔 Semi vacío
			hearts_ui[i].texture = TEXTURE_HEART_SEMIEMPTY
		else:
			# 💀 Vacío
			hearts_ui[i].texture = TEXTURE_HEART_EMPTY

		remaining -= 1.0

# --- FINAL ---
func finish_quiz() -> void:
	is_game_over = true
	# ✅ MODIFICADO: Incluye Aciertos (score / 10), Total Preguntas y Vidas (lives)
	label_question.text = "¡QUIZ TERMINADO!\nACIERTOS: %d / %d\nVIDAS: %.0f" % [
		score / POINTS_PER_CORRECT_ANSWER, 
		current_questions_set.size(), 
		lives
	]
	label_question.modulate = Color(0.1, 0.9, 0.1)
	get_tree().create_timer(3.0).timeout.connect(func():
		transition_screen(SoccerGame.ScreenType.MAIN_MENU)
	)

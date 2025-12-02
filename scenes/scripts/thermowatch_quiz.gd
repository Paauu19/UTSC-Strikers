extends Screen
class_name ThermoWatchQuiz # Cambiar según corresponda: MixedQuizScreen, ThermoWatchQuizScreen

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

# 🎯 Todas las preguntas del quiz mixto (DATA OMITIDA POR ESPACIO)
const ALL_QUIZ_DATA = {
	"thermowatch": [
	{ "text": "1. ¿Cuál es la principal \nfunción de ThermoWatch en \nla planta industrial?", "options": ["Controlar el \ninventario", "Medir la \nluz", "Prevenir fallas \npor temperatura", "Administrar \nusuarios"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "2. ¿Qué componente electrónico \nse encarga de la medición \nde temperatura?", "options": ["Sensor \nPIR", "LDR", "Sensor \nDHT11/22", "Batería"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "3. ¿Qué tecnología se usa \npara enviar datos a \nla Plataforma Web (PWA)?", "options": ["Rayos \nX", "Fax", "IoT \n(Internet of Things)", "Solo cables \nUSB"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "4. ¿Qué hace el sistema \ncuando detecta un \nsobrecalentamiento (umbral máx)?", "options": ["Apaga la \nmáquina", "Activa una alerta \nvisual/sonora", "Reinicia \nla API", "Envía \nun PDF"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "5. ¿Qué beneficio aporta \nel monitoreo constante \nvs. la revisión manual?", "options": ["Ahorra luz", "Reduce el \ntrabajo manual", "Permite detectar \nfallas en tiempo \nreal (predictivo)", "Mejora el color \nde la UI"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "6. ¿En qué unidad se mide\n la humedad relativa?", "options": ["Grados \nCelsius", "Kilogramos", "Porcentaje \n(%)", "Pascal"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "7. ¿Qué microcontrolador es \nel 'cerebro' del sistema IoT?", "options": ["Intel Core \ni9", "Raspberry \nPi", "Arduino / ESP32", "Calculadora"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "8. PWA-07: ¿Quién quiere \nestablecer los umbrales de \ntemperatura (mín/máx)?", "options": ["El \nOperador", "El \nArduino", "El \nAdministrador", "El \nDesarrollador"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "9. ¿Qué significa \nla sigla 'PWA' en el \ncontexto del proyecto?", "options": ["Public Web \nAccess", "Portable Web \nApp", "Progressive Web \nApplication", "Personal Website \nAssistant"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "10.: PWA-08: ¿Qué tipo de \nnotificación se espera \nrecibir en el móvil?", "options": ["Email \nsemanal", "Notificaciones \nPush/visuales", "Mensaje de \ntexto", "Llamada \ntelefónica"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "11.: PWA-04: ¿Cuál es el \npropósito del 'Panel de \nInventario de Maquinaria'?", "options": ["Ver las \nfallas", "CRUD para \ncatalogar maquinaria", "Ver el mapa \nde la planta", "Exportar \nreportes"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "12.: PWA-02: ¿Qué componente es \nresponsable de recibir y almacenar \nlos datos del Arduino?", "options": ["El sensor \nDHT", "La base \nde datos", "La API \n(Backend)", "El \nDashboard"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "13.: ¿Cuál es el riesgo \nprincipal si la humedad ambiental \nes demasiado alta?", "options": ["Aumento de \ntemperatura", "Corrosión de equipos \nmetálicos", "Fallas en el \nsoftware", "Apagón \ngeneral"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "14.: PWA-09: ¿Qué se espera \nver en el 'Dashboard de \nMétricas e Historial'?", "options": ["Fotos de \nla planta", "Videojuegos", "Historial de \ntemperaturas y promedios", "Comentarios de \noperadores"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "15.: ¿Qué significa \n'Mantenimiento Predictivo'?", "options": ["Arreglar algo \ncuando se rompe", "Reemplazar partes \nanualmente", "Usar datos para \npredecir fallas", "Limpiar la \nmáquina"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "16.: ¿Cuál es el \nrol de un 'Operador' en \nel sistema ThermoWatch?", "options": ["Programar el \nArduino", "Establecer \numbrales", "Recibir alertas en \ntiempo real", "Diseñar la \ninterfaz"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "17.: PWA-10: ¿Qué se usaría \npara la 'Ubicación de Maquinaria' \nsi no hay GPS?", "options": ["Un mapa \nde Google", "Un plano estático \nde la planta", "Un \nselfie", "Un diagrama \nde flujo"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "18.: ¿Qué método utiliza \nel PWA para obtener los \ndatos más recientes?", "options": ["Polling (consultar \ndatos repetidamente)", "Llamada \ntelefónica", "Correo \nelectrónico", "Descarga \nFTP"], "correct": 0, "theme": "THERMOWATCH" },
	{ "text": "19.: PWA-11: ¿Qué formato \nse solicita para la \n'Exportación de Reportes'?", "options": ["JPG o \nPNG", "GDScript", "CSV/\nPDF", "EXE"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "20.: El proyecto ThermoWatch \nestá enfocado en qué \ntipo de industria:", "options": ["Entretenimiento", "Moda", "Planta Industrial/\nManufactura", "Educación"], "correct": 2, "theme": "THERMOWATCH" }
	]
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
var quiz_mode_key: String = "thermowatch" # Clave predeterminada
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

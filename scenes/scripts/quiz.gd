extends Screen
class_name QuizGame

# --- CONSTANTES ---
const POINTS_PER_CORRECT_ANSWER := 10

# ❤️ TEXTURAS DE VIDA (4 fases)
const TEXTURE_HEART_FULL = preload("res://assets/ui/PNG/Quiz/heart_full.tres")
const TEXTURE_HEART_SEMIFULL = preload("res://assets/ui/PNG/Quiz/heart_semifull.tres")
const TEXTURE_HEART_SEMIEMPTY = preload("res://assets/ui/PNG/Quiz/heart_semiempty.tres")
const TEXTURE_HEART_EMPTY = preload("res://assets/ui/PNG/Quiz/heart_empty.tres")

# 🎯 Todas las preguntas del quiz mixto (DATA OMITIDA POR ESPACIO)
const ALL_QUIZ_DATA = {
	"SOCCER_QUIZ": [
	{ "text": "SOCCER 1: ¿Cuántos jugadores por equipo están en el campo durante un partido?", "options": ["10 jugadores", "11 jugadores", "9 jugadores", "12 jugadores"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 2: ¿Cuánto dura un tiempo reglamentario de fútbol?", "options": ["30 minutos", "45 minutos", "60 minutos", "90 minutos"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 3: ¿Qué tarjeta se utiliza para expulsar a un jugador del campo?", "options": ["Tarjeta Verde", "Tarjeta Azul", "Tarjeta Amarilla", "Tarjeta Roja"], "correct": 3, "theme": "SOCCER" },
	{ "text": "SOCCER 4: ¿Desde qué distancia se lanza un penal?", "options": ["12 metros", "11 metros", "9 metros", "15 metros"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 5: ¿Qué significa la sigla VAR?", "options": ["Visual Assistance Review", "Video Action Referee", "Video Assistant Referee", "Vertical Area Review"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 6: ¿Qué país ganó el Mundial de Fútbol masculino en 2022?", "options": ["Francia", "Brasil", "Alemania", "Argentina"], "correct": 3, "theme": "SOCCER" },
	{ "text": "SOCCER 7: ¿Qué jugador es conocido como 'La Pulga'?", "options": ["Cristiano Ronaldo", "Neymar Jr.", "Kylian Mbappé", "Lionel Messi"], "correct": 3, "theme": "SOCCER" },
	{ "text": "SOCCER 8: ¿Quién es el portero de la Selección de Argentina (2022)?", "options": ["Franco Armani", "Emiliano Martínez", "Geronimo Rulli", "Damián Martínez"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 9: ¿Qué posición juega Harry Kane?", "options": ["Defensa central", "Portero", "Delantero", "Mediocampista"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 10: ¿En qué país juega la mayoría de los jugadores de la selección de España?", "options": ["Alemania", "Francia", "España", "Inglaterra"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 11: ¿Dónde se celebró el Mundial Femenino de 2023?", "options": ["EE. UU.", "Australia y Nueva Zelanda", "Francia", "Canadá"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 12: ¿Qué país es la sede principal del Mundial 2026?", "options": ["Canadá", "México", "Estados Unidos", "Brasil"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 13: ¿Cuál es el rol principal de un Mediocampista?", "options": ["Evitar goles", "Defender y atacar, crear juego", "Anotar la mayoría de los goles", "Lanzar el balón"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 14: ¿Qué jugador tiene el récord de más Balones de Oro ganados?", "options": ["Lionel Messi", "Cristiano Ronaldo", "Pelé", "Maradona"], "correct": 0, "theme": "SOCCER" },
	{ "text": "SOCCER 15: ¿Cuál es el nombre del estadio que será sede de la final del Mundial 2026?", "options": ["Estadio Azteca (México)", "MetLife Stadium (Nueva York/NJ)", "SoFi Stadium (Los Ángeles)", "BC Place (Canadá)"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 16: ¿En qué año se celebró el primer Mundial de Fútbol?", "options": ["1930", "1950", "1966", "1900"], "correct": 0, "theme": "SOCCER" },
	{ "text": "SOCCER 17: ¿Qué país tiene más títulos de la Copa del Mundo (masculino)?", "options": ["Alemania", "Italia", "Brasil", "Argentina"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 18: ¿Cuál es el principal rol de un Defensa Central?", "options": ["Marcar goles y asistir", "Crear juego en el mediocampo", "Proteger la portería y despejar balones", "Correr por las bandas y centrar"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 19: ¿Qué se señala cuando el balón cruza la línea lateral completamente?", "options": ["Saque de esquina (corner)", "Saque de meta (portería)", "Saque de banda", "Falta directa"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 20: ¿Cuántos Mundiales Femeninos ha ganado la selección de Estados Unidos?", "options": ["Dos", "Cuatro", "Tres", "Cinco"], "correct": 1, "theme": "SOCCER" }
	],
	"THERMOWATCH_QUIZ": [
	{ "text": "THERMO 1: ¿Cuál es la principal función de ThermoWatch en la planta industrial?", "options": ["Controlar el inventario", "Medir la luz", "Prevenir fallas por temperatura", "Administrar usuarios"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 2: ¿Qué componente electrónico se encarga de la medición de temperatura?", "options": ["Sensor PIR", "LDR", "Sensor DHT11/22", "Batería"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 3: ¿Qué tecnología se usa para enviar datos a la Plataforma Web (PWA)?", "options": ["Rayos X", "Fax", "IoT (Internet of Things)", "Solo cables USB"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 4: ¿Qué hace el sistema cuando detecta un sobrecalentamiento (umbral máx)?", "options": ["Apaga la máquina", "Activa una alerta visual/sonora", "Reinicia la API", "Envía un PDF"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "THERMO 5: ¿Qué beneficio aporta el monitoreo constante vs. la revisión manual?", "options": ["Ahorra luz", "Reduce el trabajo manual", "Permite detectar fallas en tiempo real (predictivo)", "Mejora el color de la UI"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 6: ¿En qué unidad se mide la humedad relativa?", "options": ["Grados Celsius", "Kilogramos", "Porcentaje (%)", "Pascal"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 7: ¿Qué microcontrolador es el 'cerebro' del sistema IoT?", "options": ["Intel Core i9", "Raspberry Pi", "Arduino / ESP32", "Calculadora"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 8: PWA-07: ¿Quién quiere establecer los umbrales de temperatura (mín/máx)?", "options": ["El Operador", "El Arduino", "El Administrador", "El desarrollador"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 9: ¿Qué significa la sigla 'PWA' en el contexto del proyecto?", "options": ["Public Web Access", "Portable Web App", "Progressive Web Application", "Personal Website Assistant"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 10: PWA-08: ¿Qué tipo de notificación se espera recibir en el móvil?", "options": ["Email semanal", "Notificaciones Push/visuales", "Mensaje de texto", "Llamada telefónica"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "THERMO 11: PWA-04: ¿Cuál es el propósito del 'Panel de Inventario de Maquinaria'?", "options": ["Ver las fallas", "CRUD para catalogar maquinaria", "Ver el mapa de la planta", "Exportar reportes"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "THERMO 12: PWA-02: ¿Qué componente es responsable de recibir y almacenar los datos del Arduino?", "options": ["El sensor DHT", "La base de datos", "La API (Backend)", "El Dashboard"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 13: ¿Cuál es el riesgo principal si la humedad ambiental es demasiado alta?", "options": ["Aumento de temperatura", "Corrosión de equipos metálicos", "Fallas en el software", "Apagón general"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "THERMO 14: PWA-09: ¿Qué se espera ver en el 'Dashboard de Métricas e Historial'?", "options": ["Fotos de la planta", "Videojuegos", "Historial de temperaturas y promedios", "Comentarios de operadores"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 15: ¿Qué significa 'Mantenimiento Predictivo'?", "options": ["Arreglar algo cuando se rompe", "Reemplazar partes anualmente", "Usar datos para predecir fallas", "Limpiar la máquina"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 16: ¿Cuál es el rol de un 'Operador' en el sistema ThermoWatch?", "options": ["Programar el Arduino", "Establecer umbrales", "Recibir alertas en tiempo real", "Diseñar la interfaz"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 17: PWA-10: ¿Qué se usaría para la 'Ubicación de Maquinaria' si no hay GPS?", "options": ["Un mapa de Google", "Un plano estático de la planta", "Un selfie", "Un diagrama de flujo"], "correct": 1, "theme": "THERMOWATCH" },
	{ "text": "THERMO 18: ¿Qué método utiliza el PWA para obtener los datos más recientes?", "options": ["Polling (consultar datos repetidamente)", "Llamada telefónica", "Correo electrónico", "Descarga FTP"], "correct": 0, "theme": "THERMOWATCH" },
	{ "text": "THERMO 19: PWA-11: ¿Qué formato se solicita para la 'Exportación de Reportes'?", "options": ["JPG o PNG", "GDScript", "CSV/PDF", "EXE"], "correct": 2, "theme": "THERMOWATCH" },
	{ "text": "THERMO 20: El proyecto ThermoWatch está enfocado en qué tipo de industria:", "options": ["Entretenimiento", "Moda", "Planta Industrial/Manufactura", "Educación"], "correct": 2, "theme": "THERMOWATCH" }
	],
	"MIXED_QUIZ": [
	{ "text": "SOCCER 1: ¿Cuántos jugadores por equipo están en el campo durante un partido?", "options": ["10 jugadores", "11 jugadores", "9 jugadores", "12 jugadores"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 2: ¿Cuánto dura un tiempo reglamentario de fútbol?", "options": ["30 minutos", "45 minutos", "60 minutos", "90 minutos"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 3: ¿Qué tarjeta se utiliza para expulsar a un jugador del campo?", "options": ["Tarjeta Verde", "Tarjeta Azul", "Tarjeta Amarilla", "Tarjeta Roja"], "correct": 3, "theme": "SOCCER" },
	{ "text": "SOCCER 4: ¿Desde qué distancia se lanza un penal?", "options": ["12 metros", "11 metros", "9 metros", "15 metros"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 5: ¿Qué significa la sigla VAR?", "options": ["Visual Assistance Review", "Video Action Referee", "Video Assistant Referee", "Vertical Area Review"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 6: ¿Qué país ganó el Mundial de Fútbol masculino en 2022?", "options": ["Francia", "Brasil", "Alemania", "Argentina"], "correct": 3, "theme": "SOCCER" },
	{ "text": "SOCCER 7: ¿Qué jugador es conocido como 'La Pulga'?", "options": ["Cristiano Ronaldo", "Neymar Jr.", "Kylian Mbappé", "Lionel Messi"], "correct": 3, "theme": "SOCCER" },
	{ "text": "SOCCER 8: ¿Quién es el portero de la Selección de Argentina (2022)?", "options": ["Franco Armani", "Emiliano Martínez", "Geronimo Rulli", "Damián Martínez"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 9: ¿Qué posición juega Harry Kane?", "options": ["Defensa central", "Portero", "Delantero", "Mediocampista"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 10: ¿En qué país juega la mayoría de los jugadores de la selección de España?", "options": ["Alemania", "Francia", "España", "Inglaterra"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 11: ¿Dónde se celebró el Mundial Femenino de 2023?", "options": ["EE. UU.", "Australia y Nueva Zelanda", "Francia", "Canadá"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 12: ¿Qué país es la sede principal del Mundial 2026?", "options": ["Canadá", "México", "Estados Unidos", "Brasil"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 13: ¿Cuál es el rol principal de un Mediocampista?", "options": ["Evitar goles", "Defender y atacar, crear juego", "Anotar la mayoría de los goles", "Lanzar el balón"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 14: ¿Qué jugador tiene el récord de más Balones de Oro ganados?", "options": ["Lionel Messi", "Cristiano Ronaldo", "Pelé", "Maradona"], "correct": 0, "theme": "SOCCER" },
	{ "text": "SOCCER 15: ¿Cuál es el nombre del estadio que será sede de la final del Mundial 2026?", "options": ["Estadio Azteca (México)", "MetLife Stadium (Nueva York/NJ)", "SoFi Stadium (Los Ángeles)", "BC Place (Canadá)"], "correct": 1, "theme": "SOCCER" },
	{ "text": "SOCCER 16: ¿En qué año se celebró el primer Mundial de Fútbol?", "options": ["1930", "1950", "1966", "1900"], "correct": 0, "theme": "SOCCER" },
	{ "text": "SOCCER 17: ¿Qué país tiene más títulos de la Copa del Mundo (masculino)?", "options": ["Alemania", "Italia", "Brasil", "Argentina"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 18: ¿Cuál es el principal rol de un Defensa Central?", "options": ["Marcar goles y asistir", "Crear juego en el mediocampo", "Proteger la portería y despejar balones", "Correr por las bandas y centrar"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 19: ¿Qué se señala cuando el balón cruza la línea lateral completamente?", "options": ["Saque de esquina (corner)", "Saque de meta (portería)", "Saque de banda", "Falta directa"], "correct": 2, "theme": "SOCCER" },
	{ "text": "SOCCER 20: ¿Cuántos Mundiales Femeninos ha ganado la selección de Estados Unidos?", "options": ["Dos", "Cuatro", "Tres", "Cinco"], "correct": 1, "theme": "SOCCER" }
	],
}

# --- NODOS UI ---
@onready var label_question: Label = $FondoCampo/Label
@onready var option_buttons: Array[Button] = [
	$FondoCampo/BotonOpcion1,
	$FondoCampo/BotonOpcion2,
	$FondoCampo/BotonOpcion3,
	$FondoCampo/BotonOpcion4
]

# CORRECCIÓN CLAVE: Usamos la notación de nombre único (%) para los Labels.
# Esto asume que los Labels hijos de los botones tienen los nombres únicos: 
# LabelBotonOpcion1, LabelBotonOpcion2, etc., en todas las escenas.
@onready var option_labels: Array[Label] = [
	%LabelBotonOpcion1,
	%LabelBotonOpcion3,
	%LabelBotonOpcion2,
	%LabelBotonOpcion4
]

@onready var hearts_ui: Array[TextureRect] = [
	$FondoCampo/HeartsContainer/HeartTextureRect,
	$FondoCampo/HeartsContainer/HeartTextureRect2,
	$FondoCampo/HeartsContainer/HeartTextureRect3
]
@onready var boton_volver_menu: Button = $FondoCampo/BotonVolver

# --- VARIABLES ---
var current_questions_set: Array = []
var current_round := 0
var score := 0
var lives: float = 3.0
var is_waiting_for_answer := false
var is_game_over := false
var question_answered_correctly := false

# --- DATOS EXTERNOS ---
var quiz_mode := ""
var question_count := -1

# --- SETUP DESDE SCREENDATA ---
func setup_quiz_data(data) -> void:
	quiz_mode = data.quiz_mode
	question_count = data.question_count if data.question_count > 0 else ALL_QUIZ_DATA[get_quiz_key()].size()
	select_theme_mode()
	setup_quiz(get_quiz_key())

# --- OBTENER CLAVE DEL QUIZ ---
func get_quiz_key() -> String:
	match quiz_mode:
		"soccer": return "SOCCER_QUIZ"
		"mixed": return "MIXED_QUIZ"
		"thermowatch": return "THERMOWATCH_QUIZ"
		_:
			push_error("Modo de quiz desconocido: %s" % quiz_mode)
			return "MIXED_QUIZ"

# --- SELECCIONAR MODO TEMATICO ---
func select_theme_mode() -> void:
	var key = get_quiz_key()
	if ALL_QUIZ_DATA.has(key):
		print("Inicializando modo %s" % key)
	else:
		push_error("No se encontró la data del quiz: %s" % key)

# --- INICIALIZAR QUIZ ---
func setup_quiz(quiz_key: String) -> void:
	if not ALL_QUIZ_DATA.has(quiz_key):
		push_error("No se encontró la data del quiz: %s" % quiz_key)
		return

	current_questions_set = ALL_QUIZ_DATA[quiz_key].duplicate(true)
	_shuffle_options()

	if question_count > 0 and question_count < current_questions_set.size():
		current_questions_set = current_questions_set.slice(0, question_count)

	update_hearts_display()
	start_round()

# --- MEZCLAR OPCIONES ---
func _shuffle_options() -> void:
	for i in range(current_questions_set.size()):
		var q = current_questions_set[i].duplicate(true)
		var options = q["options"].duplicate()
		var correct_text = options[q["correct"]]
		options.shuffle()
		q["options"] = options
		q["correct"] = options.find(correct_text)
		current_questions_set[i] = q

# --- READY ---
func _ready() -> void:
	# No necesitamos una comprobación de error personalizada aquí, 
	# ya que si los nodos no se encuentran, serán null y GDScript lo manejará.

	if is_instance_valid(boton_volver_menu):
		boton_volver_menu.pressed.connect(func():
			transition_screen(SoccerGame.ScreenType.MAIN_MENU)
		)
	for i in range(option_buttons.size()):
		var btn = option_buttons[i]
		if is_instance_valid(btn):
			btn.pressed.connect(on_answer_submitted.bind(i))

# --- INICIAR RONDA ---
func start_round() -> void:
	if is_game_over: return
	if current_round >= current_questions_set.size():
		finish_quiz()
		return

	question_answered_correctly = false
	is_waiting_for_answer = true

	var q = current_questions_set[current_round]
	label_question.text = q.get("text", "Sin pregunta")
	label_question.modulate = Color(1,1,1)

	for i in range(option_buttons.size()):
		var btn = option_buttons[i]
		var lbl = option_labels[i] # Usamos el Label referenciado

		if is_instance_valid(lbl) and i < q["options"].size(): # Comprobamos si el Label es válido
			lbl.text = q["options"][i] # <--- CORRECCIÓN CLAVE: Usar el Label para el texto
			
			# Reiniciamos colores y habilitamos
			lbl.remove_theme_color_override("font_color")
			btn.disabled = false
			btn.modulate = Color(1,1,1)
			btn.visible = true
		else:
			btn.visible = false

# --- RESPUESTA ---
func on_answer_submitted(selected_index: int) -> void:
	if not is_waiting_for_answer or is_game_over:
		return
	is_waiting_for_answer = false

	var q = current_questions_set[current_round]
	var correct_index = q["correct"]

	for btn in option_buttons:
		btn.disabled = true

	if selected_index == correct_index:
		handle_correct_answer(selected_index)
	else:
		handle_incorrect_answer(selected_index, correct_index)

# --- CORRECTA ---
func handle_correct_answer(index: int) -> void:
	score += POINTS_PER_CORRECT_ANSWER
	question_answered_correctly = true
	
	if is_instance_valid(option_labels[index]): # Comprobación de seguridad
		option_labels[index].add_theme_color_override("font_color", Color(0,1,0))
	
	current_round += 1
	get_tree().create_timer(1.5).timeout.connect(start_round)

# --- INCORRECTA ---
func handle_incorrect_answer(selected_index: int, correct_index: int) -> void:
	lives = max(0.0, lives - 0.5)
	update_hearts_display()
	
	# Aplicar colores al Label (con comprobación de seguridad)
	if is_instance_valid(option_labels[selected_index]):
		option_labels[selected_index].add_theme_color_override("font_color", Color(1,0,0))
	if is_instance_valid(option_labels[correct_index]):
		option_labels[correct_index].add_theme_color_override("font_color", Color(0,1,0))
	
	if lives <= 0:
		is_game_over = true
		get_tree().create_timer(2.5).timeout.connect(func():
			transition_screen(SoccerGame.ScreenType.MAIN_MENU)
		)
	else:
		get_tree().create_timer(1.5).timeout.connect(func():
			for i in range(option_buttons.size()):
				var btn = option_buttons[i]
				var lbl = option_labels[i]
				
				if is_instance_valid(lbl):
					# Reiniciar colores y habilitar
					lbl.remove_theme_color_override("font_color")
					btn.disabled = false
					btn.modulate = Color(1,1,1)
			is_waiting_for_answer = true
		)

# --- CORAZONES ---
func update_hearts_display() -> void:
	var full_hearts = int(lives)
	var fractional = lives - full_hearts

	for i in range(hearts_ui.size()):
		var heart = hearts_ui[i]
		if i < full_hearts:
			heart.texture = TEXTURE_HEART_FULL
		elif fractional >= 0.75 and i == full_hearts:
			heart.texture = TEXTURE_HEART_SEMIFULL
		elif fractional >= 0.25 and i == full_hearts:
			heart.texture = TEXTURE_HEART_SEMIEMPTY
		else:
			heart.texture = TEXTURE_HEART_EMPTY

# --- FIN DEL QUIZ ---
func finish_quiz() -> void:
	is_game_over = true
	label_question.text = "¡QUIZ TERMINADO!\nPuntuación Final: %d" % score
	label_question.modulate = Color(0.1, 0.9, 0.1)
	get_tree().create_timer(3.0).timeout.connect(func():
		transition_screen(SoccerGame.ScreenType.MAIN_MENU)
	)

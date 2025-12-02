extends Screen
class_name ControlsScreen

# ❤️ TEXTURAS DE VIDA
const TEXTURE_HEART_FULL = preload("res://assets/ui/PNG/Quiz/heart_full.tres")
const TEXTURE_HEART_SEMIFULL = preload("res://assets/ui/PNG/Quiz/heart_semifull.tres")
const TEXTURE_HEART_SEMIEMPTY = preload("res://assets/ui/PNG/Quiz/heart_semiempty.tres")
const TEXTURE_HEART_EMPTY = preload("res://assets/ui/PNG/Quiz/heart_empty.tres")

# 🎯 PREGUNTAS DEL CONTROLS QUIZ
const CONTROL_QUIZ = [
	{
		"text": "PRUEBA 0: Aprende cómo jugar.",
		"options": [
			"RESPUESTA INCORRECTA!",
			"Si la respuesta no es \n correcta, se te quita \n un corazon. tienes 3 y \n cada uno aguanta \n 3 golpes, suerte.",
			"RESPUESTA CORRECTA!",
			"Usa el mouse para  \n darle click a las \n respuestas y si es \n correcta consigues \n 10 puntos"
		],
		"correct": 2  # ✅ abajo izquierda
	},
	{
		"text": "PRUEBA 1: Este es el botón de la respuesta correcta.",
		"options": ["Opción A (Falsa)", "Opción B (Falsa)", "Opción C (Falsa)", "Opción D (Correcta)"],
		"correct": 3
	},
	{
		"text": "PRUEBA 2: ¿Qué sucede si presionas una respuesta incorrecta?",
		"options": ["Ganas puntos", "El juego termina", "Se te quita una vida", "Reinicias la ronda"],
		"correct": 2
	},
	{
		"text": "PRUEBA 3: ¿Cuántos puntos obtienes por una respuesta acertada?",
		"options": ["10 Puntos", "5 Puntos", "20 Puntos", "1 Punto"],
		"correct": 0
	},
	{
		"text": "PRUEBA 4: En Godot, ¿qué hace la función 'queue_free()'?",
		"options": ["Mueve un nodo", "Detiene el juego", "Elimina el nodo", "Carga una escena"],
		"correct": 2
	},
	{
		"text": "PRUEBA 5: ¿A dónde te llevará el botón 'Volver'?",
		"options": ["A la siguiente pregunta", "Al menú principal", "Al quiz de fútbol", "A ajustes"],
		"correct": 1
	}
]

# --- NODOS DE UI ---
@onready var boton_volver: Button = $FondoCampo/BotonVolver

# Orden correcto: 1 (arriba izq), 3 (arriba der), 2 (abajo izq), 4 (abajo der)
@onready var option_buttons: Array[Button] = [
	$FondoCampo/BotonOpcion1,
	$FondoCampo/BotonOpcion3,
	$FondoCampo/BotonOpcion2,
	$FondoCampo/BotonOpcion4
]

# Labels internos de los botones
@onready var label_buttons: Array[Label] = [
	%LabelBotonOpcion1,
	%LabelBotonOpcion3,
	%LabelBotonOpcion2,
	%LabelBotonOpcion4
]

@onready var label_estado: Label = $FondoCampo/Label
@onready var hearts_ui: Array[TextureRect] = [
	$FondoCampo/HeartsContainer/HeartTextureRect,
	$FondoCampo/HeartsContainer/HeartTextureRect2,
	$FondoCampo/HeartsContainer/HeartTextureRect3
]

# --- VARIABLES DE JUEGO ---
var questions := []
var current_round := 0
var lives : float = 3.0
var score := 0
var is_waiting_for_answer := false
var question_answered_correctly := false
var is_game_over := false

func _ready() -> void:
	print("✅ ControlsScreen iniciado.")

	if is_instance_valid(boton_volver):
		boton_volver.pressed.connect(func():
			transition_screen(SoccerGame.ScreenType.MAIN_MENU)
		)

	questions = CONTROL_QUIZ.duplicate(true)

	for i in range(option_buttons.size()):
		option_buttons[i].pressed.connect(on_answer_submitted.bind(i))
		option_buttons[i].modulate = Color(1, 1, 1)
		option_buttons[i].visible = true
		option_buttons[i].disabled = false

	update_hearts_display()
	start_round()

# --- MOSTRAR PREGUNTA ---
func start_round() -> void:
	if is_game_over: return
	if current_round >= questions.size():
		finish_quiz()
		return

	var q = questions[current_round]
	print("🧠 Mostrando:", q["text"])
	label_estado.text = q["text"]
	label_estado.visible = true
	label_estado.modulate = Color(1, 1, 1)

	for i in range(option_buttons.size()):
		var btn = option_buttons[i]
		var lbl = label_buttons[i]

		if i < q["options"].size():
			lbl.text = q["options"][i]   # actualiza el texto dentro del label del botón
			btn.disabled = false
			btn.visible = true
			btn.modulate = Color(1, 1, 1)
		else:
			btn.visible = false

	question_answered_correctly = false
	is_waiting_for_answer = true

# --- RESPUESTA ---
func on_answer_submitted(selected_index: int) -> void:
	if not is_waiting_for_answer or is_game_over:
		return

	is_waiting_for_answer = false
	var q = questions[current_round]
	var correct_index = q["correct"]

	if selected_index == correct_index:
		handle_correct_answer(selected_index)
	else:
		handle_incorrect_answer(selected_index, correct_index)

# --- CORRECTA ---
func handle_correct_answer(index: int) -> void:
	option_buttons[index].modulate = Color(0, 1, 0)
	label_estado.text = "✅ ¡Correcto!"
	label_estado.modulate = Color(0, 1, 0)
	score += 10
	question_answered_correctly = true

	current_round += 1
	get_tree().create_timer(1.5).timeout.connect(start_round)

# --- INCORRECTA ---
func handle_incorrect_answer(selected_index: int, correct_index: int) -> void:
	if question_answered_correctly:
		return

	# ❤️ Pierde exactamente 1/3 de corazón
	lives = max(0.0, round((lives - 0.3333333) * 100.0) / 100.0)
	update_hearts_display()

	option_buttons[selected_index].modulate = Color(1, 0, 0)
	option_buttons[correct_index].modulate = Color(0, 1, 0)

	if lives <= 0.0:
		is_game_over = true
		label_estado.text = "💀 GAME OVER\nACIERTOS: %d / %d" % [score / 10, questions.size()]
		label_estado.modulate = Color(1, 0, 0)
		get_tree().create_timer(2.5).timeout.connect(func():
			transition_screen(SoccerGame.ScreenType.MAIN_MENU)
		)
	else:
		label_estado.text = "❌ Incorrecto. ¡Vuelve a intentarlo!"
		label_estado.modulate = Color(1, 0.3, 0.3)
		is_waiting_for_answer = true


# --- CORAZONES ---
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
	label_estado.text = "🏁 QUIZ TERMINADO\nACIERTOS: %d / %d\nVIDAS: %.0f" % [
		score / 10, questions.size(), lives]
	label_estado.modulate = Color(1, 0.84, 0)
	get_tree().create_timer(3.0).timeout.connect(func():
		transition_screen(SoccerGame.ScreenType.MAIN_MENU)
	)

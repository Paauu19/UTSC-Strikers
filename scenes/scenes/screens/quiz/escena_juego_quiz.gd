extends Screen
class_name QuizGameScreen

const POINTS_PER_CORRECT_ANSWER := 10

# --- RECURSOS DE UI (VIDAS) ---
const TEXTURE_HEART_FULL = preload("res://assets/art/ui/quiz/heart_full.tres")
const TEXTURE_HEART_EMPTY = preload("res://assets/art/ui/quiz/heart_empty.tres")

# --- REFERENCIAS A NODOS (Solo UI) ---
# Usamos el path de tu escena: $TextureRect/Label
@onready var label_question: Label = $TextureRect/Label 

# 🎯 Aquí DEBES conectar 4 nodos Button dentro de $TextureRect/AnswersContainer/VBoxContainer
# y nombrarlos (ej. BotonOpcion1, BotonOpcion2, etc.)
# Si no existen, necesitas añadirlos en tu escena QuizNode.tscn DENTRO de VBoxContainer.
var option_buttons: Array[Button] = [] # Se inicializará en _ready

@onready var hearts_ui : Array[Sprite2D] = [
	$TextureRect/HeartsContainer/Sprite2D,
	$TextureRect/HeartsContainer/Sprite2D2,
	$TextureRect/HeartsContainer/Sprite2D3
]

# --- BANCOS DE PREGUNTAS (Sin cambios) ---
# [ Mantener QUESTIONS_ANIMALS y QUESTIONS_SOCCER aquí ]
# ...

# --- VARIABLES DE ESTADO ---
var current_questions_set : Array[Dictionary] = []
var current_round := 0
var current_scores := [0] # Solo necesitamos un score total
var lives : int = 3
var is_waiting_for_answer := false
var is_game_over := false

# --- 🎯 NUEVA FUNCIÓN: Inicialización de Botones ---
func _ready() -> void:
	randomize()
	
	# 1. Obtener los botones del contenedor (DEBES AÑADIR LOS BOTONES EN EL EDITOR)
	# Asume que $TextureRect/AnswersContainer/VBoxContainer tiene los 4 botones
	var container = $TextureRect/AnswersContainer/VBoxContainer
	for child in container.get_children():
		if child is Button: # Si el botón es un nodo Button
			option_buttons.append(child)
			# Conectar la señal 'pressed' del botón directamente al manejador de respuestas
			child.pressed.connect(on_answer_submitted.bind(option_buttons.size() - 1))
			
	if option_buttons.size() < 4:
		push_error("¡ERROR! Faltan 4 nodos Button en el VBoxContainer de QuizNode.tscn.")

	# 2. Configuración inicial
	select_theme_mode()
	lives = 3
	update_hearts_display()
	start_round()

# La clase hija debe SOBRESCRIBIR esta función para cargar las preguntas correctas
func select_theme_mode() -> void:
	# Por defecto, carga preguntas de animales (comportamiento de tu código base)
	var pool = QUESTIONS_ANIMALS.duplicate()
	pool.shuffle()
	current_questions_set = pool.slice(0, 5)

func start_round() -> void:
	if is_game_over: return
	if current_round >= current_questions_set.size():
		finish_quiz()
		return
		
	var q = current_questions_set[current_round]
	
	# 1. Mostrar la pregunta
	label_question.text = q["text"]
	label_question.modulate = Color(0, 0, 0) # Texto negro (tu estilo)
	
	# 2. Mostrar las opciones y habilitar botones
	var indices = [0, 1, 2, 3]
	indices.shuffle()
	
	for i in range(option_buttons.size()):
		var target_btn_idx = indices[i]
		var btn = option_buttons[target_btn_idx]
		
		if i < q["options"].size():
			btn.text = q["options"][i]
			btn.visible = true
			btn.disabled = false
			btn.modulate = Color(1, 1, 1) # Color normal
		else:
			btn.visible = false

	is_waiting_for_answer = true

# 🎯 FUNCIÓN DE RESPUESTA: Usando el índice del botón presionado
func on_answer_submitted(selected_index: int) -> void:
	if not is_waiting_for_answer or is_game_over: return
	
	is_waiting_for_answer = false
	var q = current_questions_set[current_round]
	var correct_index = q["correct"]
	
	# Deshabilitar botones inmediatamente
	for btn in option_buttons:
		btn.disabled = true
	
	# Colorear la respuesta correcta y la seleccionada
	option_buttons[correct_index].modulate = Color(0, 1, 0) # Siempre verde la correcta
	
	if selected_index == correct_index:
		handle_correct_answer(selected_index)
	else:
		option_buttons[selected_index].modulate = Color(1, 0, 0) # Rojo si es incorrecta
		handle_incorrect_answer()

	current_round += 1
	get_tree().create_timer(2.0).timeout.connect(start_round)

func handle_correct_answer() -> void:
	current_scores[0] += POINTS_PER_CORRECT_ANSWER
	label_question.text = "¡CORRECTO! Puntos: " + str(current_scores[0])
	label_question.modulate = Color(0, 0.5, 0)

func handle_incorrect_answer() -> void:
	lives -= 1
	update_hearts_display()
	
	if lives <= 0:
		is_game_over = true
		label_question.text = "💀 GAME OVER\nACIERTOS: %d / %d" % [current_scores[0] / POINTS_PER_CORRECT_ANSWER, current_questions_set.size()]
		label_question.modulate = Color(1, 0, 0) # Rojo
		
		get_tree().create_timer(3.0).timeout.connect(func():
			transition_screen(SoccerGame.ScreenType.MAIN_MENU) 
		)
	else:
		label_question.text = "❌ ¡INCORRECTO! Vidas: %d" % lives
		label_question.modulate = Color(0.5, 0, 0) # Rojo oscuro

func update_hearts_display() -> void:
	# Asume que Sprite2D tiene hframes (Frame 0: Lleno, Frame 3: Vacío)
	for i in range(hearts_ui.size()):
		var heart = hearts_ui[i]
		if i < lives:
			heart.set_frame(0) 
		else:
			heart.set_frame(3) 

func finish_quiz() -> void:
	is_game_over = true
	label_question.text = "🏁 QUIZ TERMINADO\nACIERTOS: %d / %d\nVIDAS: %d" % [current_scores[0] / POINTS_PER_CORRECT_ANSWER, current_questions_set.size(), lives]
	label_question.modulate = Color(1, 0.84, 0) # Dorado
	
	get_tree().create_timer(4.0).timeout.connect(func():
		transition_screen(SoccerGame.ScreenType.MAIN_MENU)
	)

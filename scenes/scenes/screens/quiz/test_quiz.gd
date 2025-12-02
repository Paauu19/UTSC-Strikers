extends QuizGame
class_name TestQuiz

func select_theme_mode() -> void:
	if ALL_QUIZ_DATA.has("TUTORIAL_QUIZ"):
		var pool = ALL_QUIZ_DATA["TUTORIAL_QUIZ"].duplicate(true)
		pool.shuffle()
		current_questions_set = pool
		print("🧠 Modo TEST QUIZ (Tutorial) Activado (%d Preguntas)" % current_questions_set.size())
	else:
		push_error("❌ ERROR: No se encontró la data de TUTORIAL_QUIZ.")

# 🔰 NUEVO: Mostrar la primera pregunta con la respuesta correcta resaltada
func _show_tutorial_intro() -> void:
	start_round() # carga primera pregunta
	var q = current_questions_set[current_round]
	var correct_idx = q["correct"]

	# Resalta el botón correcto al inicio
	for i in range(option_buttons.size()):
		if i == correct_idx:
			option_buttons[i].modulate = Color(0, 1, 0) # Verde
		else:
			option_buttons[i].modulate = Color(0.8, 0.8, 0.8) # Gris

	label_question.text = "👆 Este es un ejemplo: presiona la respuesta correcta para continuar."
	label_question.modulate = Color(0.8, 0.8, 0.8) # Gris

	is_waiting_for_answer = true

# 🧩 Reescribimos on_answer_submitted para solo avanzar si aciertas
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
		current_round += 1
		# Avanza solo si acierta
		get_tree().create_timer(1.5).timeout.connect(start_round)
	else:
		handle_incorrect_answer(selected_index, correct_index)
		# No avanza hasta acertar
		is_waiting_for_answer = true
		for btn in option_buttons:
			btn.disabled = false

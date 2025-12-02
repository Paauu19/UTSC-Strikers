extends Screen
class_name QuizNumberSelectionScreen

@onready var boton_5: Button = %Boton5P
@onready var boton_10: Button = %Boton10P
@onready var boton_all: Button = %BotonTP
@onready var boton_back: Button = %BotonVolverSelect

func setup(game: SoccerGame, data: ScreenData) -> void:
	super.setup(game, data)
	# Ya no hace falta asignar manualmente; Screen ya tiene screen_data

func _ready() -> void:
	boton_5.pressed.connect(func():
		_start_quiz(5)
	)

	boton_10.pressed.connect(func():
		_start_quiz(10)
	)

	boton_all.pressed.connect(func():
		_start_quiz(-1)
	)

	boton_back.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.QUIZ_MODE_SELECTION)
	)

func _start_quiz(question_count: int) -> void:
	if screen_data == null:
		push_error("❌ No se recibió ScreenData desde la pantalla anterior.")
		return

	screen_data.set_question_count(question_count)

	match screen_data.quiz_mode:
		"soccer":
			transition_screen(SoccerGame.ScreenType.SOCCER_QUIZ, screen_data)
			print("📊 Modo seleccionado:", screen_data.quiz_mode, " | Preguntas:", question_count)
		"mixed":
			transition_screen(SoccerGame.ScreenType.MIXED_QUIZ, screen_data)
			print("📊 Modo seleccionado:", screen_data.quiz_mode, " | Preguntas:", question_count)

		"thermowatch":
			transition_screen(SoccerGame.ScreenType.THERMOWATCH_QUIZ, screen_data)
			print("📊 Modo seleccionado:", screen_data.quiz_mode, " | Preguntas:", question_count)

		_:
			push_warning("⚠️ Modo desconocido: " + str(screen_data.quiz_mode))

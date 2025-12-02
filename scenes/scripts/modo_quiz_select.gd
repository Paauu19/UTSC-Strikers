extends Screen
class_name QuizSelectionScreen

@onready var boton_quiz_soccer: Button = %BotonSoccer
@onready var boton_quiz_mixed: Button = %BotonMixto
@onready var boton_quiz_thermowatch: Button = %BotonThermowatch
@onready var boton_back: Button = %BotonVolver

func _ready() -> void:
	# ⚽ Modo Soccer
	boton_quiz_soccer.pressed.connect(func():
		var data := ScreenData.build().set_quiz_mode("soccer")
		transition_screen(SoccerGame.ScreenType.QUIZ_NUMBER_SELECTION, data)
	)

	# 🌀 Modo Mixto
	boton_quiz_mixed.pressed.connect(func():
		var data := ScreenData.build().set_quiz_mode("mixed")
		transition_screen(SoccerGame.ScreenType.QUIZ_NUMBER_SELECTION, data)
	)

	# ♨️ Modo Thermowatch
	boton_quiz_thermowatch.pressed.connect(func():
		var data := ScreenData.build().set_quiz_mode("thermowatch")
		transition_screen(SoccerGame.ScreenType.QUIZ_NUMBER_SELECTION, data)
	)

	# 🔙 Regresar
	boton_back.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.MAIN_MENU)
	)

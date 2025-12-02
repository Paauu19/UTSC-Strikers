extends Screen
class_name MainMenuScreen

@onready var boton_start: Button = %BotonStart
@onready var boton_controls: Button = %BotonControls
@onready var boton_about: Button = %BotonAbout

func _ready() -> void:
	if boton_start:
		boton_start.pressed.connect(func():
			print("🟢 Ir a QUIZ MODE SELECT")
			transition_screen(SoccerGame.ScreenType.QUIZ_MODE_SELECTION)
		)

	if boton_controls:
		boton_controls.pressed.connect(func():
			print("🟡 Ir a CONTROLS")
			transition_screen(SoccerGame.ScreenType.CONTROLS)
		)

	if boton_about:
		boton_about.pressed.connect(func():
			print("🔵 Ir a ABOUT")
			transition_screen(SoccerGame.ScreenType.ABOUT)
		)

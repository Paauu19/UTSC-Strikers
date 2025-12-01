extends Screen
class_name MainMenuScreen

# Referencias a tus botones en MenuPrincipal.tscn
@onready var boton_start: Button = $botones/ContenedorBotones/BotonStart
@onready var boton_controls: Button = $botones/ContenedorBotones/BotonControls
@onready var boton_about: Button = $botones/ContenedorBotones/BotonAbout

func _ready() -> void:
	# 1. Botón "Iniciar" -> Ir al Selector de Quiz
	boton_start.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.QUIZ_MODE_SELECTION)
	)
	
	# 2. Botón "Controles"
	boton_controls.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.CONTROLS)
	)
	
	# 3. Botón "About"
	boton_about.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.ABOUT)
	)

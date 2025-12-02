extends Screen
class_name QuizNumberSelectionScreen

# Asegúrate de que los nombres de tus botones coincidan en la escena.

@onready var boton_quiz_soccer: Button = %BotonSoccer
@onready var boton_quiz_mixed: Button = %BotonMixto
@onready var boton_back: Button = %BotonVolver
@onready var boton_quiz_thermowatch: Button = %BotonThermowatch

func _ready() -> void:
	# 1. Quiz sobre tu Proyecto
	boton_quiz_thermowatch.pressed.connect(func():
		# Puedes pasar el tema del quiz en ScreenData si lo necesitas
		transition_screen(SoccerGame.ScreenType.THERMOWATCH_QUIZ)
	)
	
	# 2. Quiz sobre el Mundial 2025
	boton_quiz_soccer.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.SOCCER_QUIZ)
	)
	
	# 3. Test Quiz (Usaremos ANIMALS_QUIZ o el que desees)
	boton_quiz_mixed.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.MIXED_QUIZ)
	)
	
	# 4. Botón de Regreso
	boton_back.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.MAIN_MENU)
	)

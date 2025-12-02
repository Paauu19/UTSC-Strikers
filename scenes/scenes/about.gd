extends Screen
class_name AboutScreen

@onready var boton_volver: Button = $FondoCampo/BotonVolver

func _ready() -> void:
	if boton_volver:
		boton_volver.pressed.connect(func():
			print("⬅️ Volver al menú principal desde About")
			transition_screen(SoccerGame.ScreenType.MAIN_MENU)
		)

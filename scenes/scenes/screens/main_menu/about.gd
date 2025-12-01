extends Screen
class_name AboutScreen

# Referencia al botón "Volver a Menu" de la escena About
@onready var boton_volver: Button = $FondoCampo/BotonVolver

func _ready() -> void:
	# Conexión del botón Volver para regresar al menú principal
	boton_volver.pressed.connect(func():
		transition_screen(SoccerGame.ScreenType.MAIN_MENU)
	)

# Opcional: Si quieres mostrar el contenido "Sobre mi" dinámicamente,
# usa la referencia $FondoCampo/TextureRect/Label para ajustar el texto.

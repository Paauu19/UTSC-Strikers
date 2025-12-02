extends Screen
class_name AboutScreen

@onready var boton_volver: Button = $FondoCampo/BotonVolver
@onready var boton_descarga: Button = $FondoCampo/BotonDescarga # ✅ REFERENCIA AL NUEVO BOTÓN

const REPOSITORY_URL = "https://github.com/Paauu19/UTSC-Strikers" # ✅ ENLACE DEL REPOSITORIO

func _ready() -> void:
	if boton_volver:
		boton_volver.pressed.connect(func():
			print("⬅️ Volver al menú principal desde About")
			transition_screen(SoccerGame.ScreenType.MAIN_MENU)
		)
	
	if boton_descarga:
		boton_descarga.pressed.connect(on_descarga_pressed) # ✅ CONEXIÓN DEL BOTÓN DE DESCARGA

func on_descarga_pressed() -> void:
	# Este método intenta abrir el enlace en el navegador predeterminado del sistema
	OS.shell_open(REPOSITORY_URL)
	print("🌐 Abriendo repositorio: ", REPOSITORY_URL)

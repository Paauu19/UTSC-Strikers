extends Node
class_name SoccerGame

# 1. Definición de todos los tipos de pantalla (ScreenType)
# Incluye los que ya tenías y los nuevos tipos de Quiz que definimos:
enum ScreenType {
	MAIN_MENU, 
	QUIZ_MODE_SELECTION, 
	CONTROLS, 
	ABOUT, 
	TEST_QUIZ ,
	MIXED_QUIZ , 
	THERMOWATCH_QUIZ,      # Quiz de Test
	SOCCER_QUIZ,       # Quiz Mundial 2025     # Quiz sobre tu proyecto (Añadido)
}

var current_screen : Screen = null
var screen_factory := ScreenFactory.new()

func _init() -> void:
	# Inicia el juego mostrando el Menú Principal
	switch_screen(ScreenType.MAIN_MENU)

# 2. Función principal para cambiar de pantalla
func switch_screen(screen: ScreenType, data: ScreenData = ScreenData.new()) -> void:
	# A. Eliminar la pantalla actual
	if current_screen != null:
		current_screen.queue_free()
	
	# B. Instanciar la nueva pantalla usando la fábrica
	current_screen = screen_factory.get_fresh_screen(screen)
	
	if current_screen != null:
		# C. Configurar el contexto y los datos de la pantalla
		current_screen.setup(self, data)
		
		# D. Conectar la señal de transición de la nueva pantalla
		# Esto permite que la pantalla, al llamar a transition_screen(), 
		# active nuevamente esta función (switch_screen) con la nueva pantalla solicitada.
		if current_screen.screen_transition_requested.is_connected(switch_screen.bind()):
			current_screen.screen_transition_requested.disconnect(switch_screen.bind())
			
		current_screen.screen_transition_requested.connect(switch_screen.bind())
		
		# E. Añadir la nueva pantalla al árbol de escena
		call_deferred("add_child", current_screen)
	else:
		push_error("No se pudo cargar la pantalla: " + str(screen))

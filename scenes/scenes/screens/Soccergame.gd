extends Node
class_name SoccerGame

enum ScreenType {
	MAIN_MENU,
	QUIZ_MODE_SELECTION,
	CONTROLS,
	ABOUT,
	TEST_QUIZ,
	MIXED_QUIZ,
	THERMOWATCH_QUIZ,
	SOCCER_QUIZ,
}

var current_screen: Screen
var screen_factory := ScreenFactory.new()

func _ready() -> void:
	print("🎮 SoccerGame iniciado.")
	switch_screen(ScreenType.MAIN_MENU)

func switch_screen(screen: ScreenType, data: ScreenData = ScreenData.new()) -> void:
	if current_screen:
		print("🔄 Eliminando escena actual: ", current_screen.name)
		current_screen.queue_free()

	print("🎬 Cargando escena: ", str(screen))
	var new_screen: Screen = screen_factory.get_fresh_screen(screen)

	if not new_screen:
		push_error("❌ No se pudo crear la pantalla " + str(screen))
		return

	current_screen = new_screen
	current_screen.setup(self, data)

	# Evitar conexiones duplicadas
	if current_screen.screen_transition_requested.is_connected(switch_screen):
		current_screen.screen_transition_requested.disconnect(switch_screen)

	current_screen.screen_transition_requested.connect(switch_screen)
	call_deferred("add_child", current_screen)

	print("✅ Pantalla agregada: ", current_screen.name)

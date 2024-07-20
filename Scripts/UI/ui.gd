extends CanvasLayer

@onready var SFX_BUS = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS = AudioServer.get_bus_index("MUSIC")
@onready var MASTER_BUS = AudioServer.get_bus_index("Master")
@onready var master_slider: HSlider = $PauseMenu/MarginContainer/VBoxContainer/SettingsGridContainer/MasterSlider
@onready var music_slider: HSlider = $PauseMenu/MarginContainer/VBoxContainer/SettingsGridContainer/MusicSlider
@onready var sfx_slider: HSlider = $PauseMenu/MarginContainer/VBoxContainer/SettingsGridContainer/SFXSlider
@onready var settings_grid_container: GridContainer = $PauseMenu/MarginContainer/VBoxContainer/SettingsGridContainer
@onready var pause_menu: Control = $PauseMenu
@onready var main_ui: Control = $MainUi
@onready var quit = $PauseMenu/MarginContainer/VBoxContainer/Quit
@onready var why: bool = true

@export var action_items: Array[String]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	pause_menu.visible = false
	create_action_remap_items()
	
	
func update_slider() -> void:
	master_slider.value = db_to_linear(AudioServer.get_bus_volume_db(MASTER_BUS))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(SFX_BUS))
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(MUSIC_BUS))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		pause_menu.visible = !pause_menu.visible
		main_ui.visible = !main_ui.visible
		get_tree().paused = !get_tree().paused
		
func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_pause_menu_visibility_changed() -> void:
	if not why:
		return
	quit.grab_focus()


func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MASTER_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(MASTER_BUS, value < 0.05)

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS, value < 0.05)
	
func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS, value < 0.05)

func create_action_remap_items() -> void:
	var previous_item = settings_grid_container.get_child(settings_grid_container.get_child_count() - 1)
	for index in range(action_items.size()):
		var action = action_items[index]		
		var label = Label.new()
		label.text = action
		settings_grid_container.add_child(label)
		var button = RemapButton.new()
		button.action = action
		button.focus_neighbor_top = previous_item.get_path()
		previous_item.focus_neighbor_bottom = button.get_path()
		if index == action_items.size() - 1:
			quit.focus_neighbor_top = button.get_path()
			button.focus_neighbor_bottom = quit.get_path()
		previous_item = button
		settings_grid_container.add_child(button)

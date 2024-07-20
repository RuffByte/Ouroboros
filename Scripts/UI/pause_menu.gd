extends Control

@onready var SFX_BUS = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS = AudioServer.get_bus_index("MUSIC")
@onready var MASTER_BUS = AudioServer.get_bus_index("Master")

@onready var master_slider: HSlider = $MarginContainer/VBoxContainer/GridContainer/MasterSlider
@onready var sfx_slider: HSlider = $MarginContainer/VBoxContainer/GridContainer/SFXSlider
@onready var music_slider: HSlider = $MarginContainer/VBoxContainer/GridContainer/MusicSlider

@onready var settings_grid_container: GridContainer = $MarginContainer/VBoxContainer/SettingsGridContainer
@onready var main_menu_button: Button = $MarginContainer/VBoxContainer/MainMenuButton

@export var action_items: Array[String]

func _ready() -> void:
	create_action_remap_items()
	master_slider.value = db_to_linear(AudioServer.get_bus_volume_db(MASTER_BUS))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(SFX_BUS))
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(MUSIC_BUS))

func _process(delta: float) -> void:
	pass

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
			main_menu_button.focus_neighbor_top = button.get_path()
			button.focus_neighbor_bottom = main_menu_button.get_path()
		previous_item = button
		settings_grid_container.add_child(button)

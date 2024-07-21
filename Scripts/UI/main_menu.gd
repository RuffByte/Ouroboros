extends Control
@onready var margin_container: MarginContainer = $MarginContainer
@onready var button_vbox: VBoxContainer = $MarginContainer/MenuVbox/ButtonVbox
@onready var SFX_BUS = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS = AudioServer.get_bus_index("MUSIC")
@onready var MASTER_BUS = AudioServer.get_bus_index("Master")
@onready var settings: MarginContainer = $Settings
@onready var menu: Button = $Settings/VBoxContainer/Menu
@onready var main_menu_button: Button = $Settings/VBoxContainer/Menu
@onready var settings_grid_container: GridContainer = $Settings/VBoxContainer/SettingsGridContainer



@export var action_items: Array[String]
func _ready() -> void:
	create_action_remap_items()
	focus_button()
	SoundManager.play_sound("MidnightDreams")
	Filter.visible = false

func focus_button() -> void:
	if button_vbox:
		var button: Button = button_vbox.get_child(0)
		if button is Button:
			button.grab_focus()	

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_play_pressed() -> void:
	TransitionManager.change_scene("res://Scenes/Cutscenes/SHOOTITUP.tscn")
	Ui.visible = true
	Ui.update_slider()
	Filter.visible = true

func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MASTER_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(MASTER_BUS, value < 0.05)

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS, value < 0.05)
	SoundManager.play_sound("Tap")

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS, value < 0.05)

func _on_options_pressed() -> void:
	margin_container.visible = false
	settings.visible = true

func _on_menu_pressed() -> void:
	settings.visible = false
	margin_container.visible = true

func _on_margin_container_visibility_changed() -> void:
	if visible:
		focus_button()

func _on_settings_visibility_changed() -> void:
	if visible:
		main_menu_button.grab_focus()

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

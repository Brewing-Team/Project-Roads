extends Control

@onready var settingsPopup = $SettingsMenu

func _on_continue_pressed():
	pass # Replace with function body.

func _on_new_game_pressed():
	pass # Replace with function body.

func _on_settings_pressed():
	settingsPopup.show()
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.

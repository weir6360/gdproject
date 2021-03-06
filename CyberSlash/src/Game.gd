extends Node
# This class contains controls that should always be accessible, like pausing
# the game or toggling the window full-screen.


# The "_" prefix is a convention to indicate that variables are private,
# that is to say, another node or script should not access them.
#onready var _pause_menu = $InterfaceLayer/PauseMenu


func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()


func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()
	# The GlobalControls node, in the Stage scene, is set to process even
	# when the game is paused, so this code keeps running.
	# To see that, select GlobalControls, and scroll down to the Pause category
	# in the inspector.
	#elif event.is_action_pressed("toggle_pause"):
	#	var tree = get_tree()
	#	tree.paused = not tree.paused
	#	if tree.paused:
	#		_pause_menu.open()
	#	else:
	#		_pause_menu.close()
	#	get_tree().set_input_as_handled()

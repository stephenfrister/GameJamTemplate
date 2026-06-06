extends Node2D


@onready var game_version = $MarginContainer/Control2/Version


func _ready():
	
	Data.data_load()
	_set_window_position()
	_display_game_version()
	
	pass

func _set_window_position(): 
	#print_debug("_on_set_window_position...")
	
	# starts minimized and transparent to hide the startup transition
	# set the mode to windowed and set the last user set position at startup
	get_window().mode = Window.Mode.MODE_WINDOWED
	get_window().position = Data.setting_position
	
	get_window().borderless = false
	get_window().transparent = false
	get_window().size = Vector2(1152,648)
	
	#print( "window size: " + str(get_window().size) )
	
	pass

func _display_game_version(): 
	
	game_version.text = "version: " + Data.version_game
	
	pass

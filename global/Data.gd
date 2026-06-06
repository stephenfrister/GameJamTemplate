extends Node

var version_game = "2026.0605.01"
var version_cfg = 0

#var default_save = OS.get_unique_id()
#var setting_save = default_save

var music_enabled = true
var music_volume = 50

var settings_loaded = false

var default_position = Vector2( 100, 100 )
#var default_theme  = "blue"
#var default_music  = true
#var default_music_type = "mute"
#var default_volume = 50

var setting_position = default_position
#var setting_theme    = default_theme
#var setting_music    = default_music
#var setting_volume   = default_volume
#var setting_music_type = default_music_type


func _ready():
	
	# pass quit notification to main
	get_tree().set_auto_accept_quit(false)
	
	#data_load()
	
	pass

func _notification(what):
	
	# save data when the game exits
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		
		setting_position = get_window().position
		
		data_save()
		
		get_tree().quit()
		
		pass
	
	pass

func data_save():
	#print_debug("data_save...")
	
	# initiate config file 
	var config = ConfigFile.new()  
#	var _err = config.load("user://settings.cfg")
	
	config.set_value("version", "version", version_game)
	#config.set_value("save", "setting_save", setting_save)
	
	config.set_value("settings", "setting_position", setting_position)
	print_debug("save default_position: " + str(setting_position) )
	
	#config.set_value("settings", "setting_theme", setting_theme)
	#config.set_value("settings", "setting_music", setting_music)
	#config.set_value("settings", "setting_volume", setting_volume)
	#config.set_value("settings", "setting_music_type", setting_music_type)
	
	# save config file 
	config.save("user://settings.cfg")
	
	pass

func data_load(): 
	#print_debug("data_load...")
	
	# load config file data 
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")
	
	# If the file didn't load, ignore it.
	if err != OK:
		print_debug("err != OK")
		settings_loaded = true
		return
	
	version_cfg          = config.get_value("version", "version", 0)
	
	setting_position     = config.get_value("settings", "setting_position", default_position)
	#print_debug("load setting_position: " + str(setting_position) )
	
	#setting_theme       = config.get_value("settings", "setting_theme", default_theme)
	#setting_music        = config.get_value("settings", "setting_music", default_music)
	#setting_volume       = config.get_value("settings", "setting_volume", default_volume)
	#setting_music_type     = config.get_value("settings", "setting_music_type", default_music_type)
	
	#print_debug("load setting_volume: " + str(default_volume) )
	
	settings_loaded = true
	
	pass

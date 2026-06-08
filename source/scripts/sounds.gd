extends Node2D



func _ready():
	
	%Music.play()
	
	pass

func _on_start_play_test_sound() -> void:
	
	%Chime.play()
	
	pass

func _on_start_restart_music() -> void:
	
	%Music.play()
	
	pass

func _set_sound_level(): 
	#print_debug("_set_sound_level... " )
	
	var setting_volume_music_db = linear_to_db( Data.setting_volume_music ) - 40
	var setting_volume_sfx_db = linear_to_db( Data.setting_volume_sfx ) - 40
	
	AudioServer.set_bus_volume_db( AudioServer.get_bus_index("Music"), setting_volume_music_db )
	AudioServer.set_bus_volume_db( AudioServer.get_bus_index("SFX"), setting_volume_sfx_db )
	
	if Data.setting_volume_music == 0 || !Data.setting_music_enabled : 
		AudioServer.set_bus_mute( AudioServer.get_bus_index("Music"), true )
	
	if Data.setting_volume_sfx == 0 || !Data.setting_sfx_enabled : 
		AudioServer.set_bus_mute( AudioServer.get_bus_index("SFX"), true )
#	
	if AudioServer.is_bus_mute( AudioServer.get_bus_index("Music") ) && Data.setting_music_enabled: 
		AudioServer.set_bus_mute( AudioServer.get_bus_index("Music"), false )
	
	if AudioServer.is_bus_mute( AudioServer.get_bus_index("SFX") ) && Data.setting_sfx_enabled: 
		AudioServer.set_bus_mute( AudioServer.get_bus_index("SFX"), false )
	
	pass

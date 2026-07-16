extends Node

const DEFAULT_SETTINGS: Dictionary = {
	"camera": {
		"fov": 75
	},
	"display": {
		"fullscreen": false,
	},
	"controls": {
		"mouse_sensitivity": 0.5,
	},
}
var user_config: ConfigFile


func _init() -> void:
	user_config = ConfigFile.new()
	var err: Error = user_config.load("user://settings.cfg")
	
	if err != OK:
		printerr("Could not load settings, resetting settings")
		user_config.save("user://settings.cfg")
	
	for section: String in DEFAULT_SETTINGS.keys():
		var config_keys: Dictionary = DEFAULT_SETTINGS[section]
		for key: String in config_keys.keys():
			_get_or_set(user_config, section, key, DEFAULT_SETTINGS[section][key])
	
	user_config.save("user://settings.cfg")


func get_value(section: String, key: String) -> Variant:
	# fallback
	var default: Variant = DEFAULT_SETTINGS[section][key]
	return user_config.get_value(section, key, default)


func _get_or_set(conf: ConfigFile, section: String, key: String, default: Variant) -> void:
	var ret: Variant = conf.get_value(section, key, null)
	if ret == null:
		conf.set_value(section, key, default)

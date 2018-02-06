extends Node2D
export (PackedScene) var Ameba

func _ready():
	randomize()

func _on_AmebaTimer_timeout():
	$AmebaPath/AmebaSpawnPosition.set_offset(randi())
	var ameba = Ameba.instance()
	add_child(ameba)
	ameba.position = $AmebaPath/AmebaSpawnPosition.position

func _on_Player_death():
	$AmebaTimer.stop()
	remove_child($Player)
	
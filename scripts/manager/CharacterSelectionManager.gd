extends Node


var player
var playerScript = preload("res://Objects/characters/keroppi/Player.gd")
#playerScript.player_id = 1

var opponent
var opponentScript = preload("res://Objects/characters/keroppi/Player.gd")

var selectable_characters = {
	"Keroppi" : preload("res://Objects/characters/keroppi/PlayerAni.tscn"),
	"Keroppi Back" : preload("res://Objects/characters/keroppi/keroppi_back.tscn"),
	"Hangyodon" : preload("res://Objects/characters/Hangyodon/Hangy.tscn"),
	"Hangyodon Back" : preload("res://Objects/characters/Hangyodon/Hangy_back.tscn")
}

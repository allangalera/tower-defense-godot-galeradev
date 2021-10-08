extends Node

var towers = {
	"GunT1": {
		"damage": 20,
		"rof": 1,
		"range": 350,
		"category": "Projectile",
		"cost": 50,
	},
	"GunT2": {
		"damage": 50,
		"rof": 1,
		"range": 350,
		"category": "Projectile",
		"cost": 75,
	},
	"MissileT1": {
		"damage": 100,
		"rof": 3,
		"range": 550,
		"category": "Missile",
		"cost": 200,
	}
}

var enemies = {
	"BlueTank": {
		"health": 50,
		"speed": 150,
		"base_damage": 21,
		"reward": 50
	}
}

var maps =  {
	"Map1": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			],
			[
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				},
				{
					"name": "BlueTank",
					"waitTime": 1.0,
				}
			]
		]
	}
}

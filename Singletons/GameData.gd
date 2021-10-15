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
	},
	"Map2": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map3": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map4": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map5": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map6": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map7": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map8": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map9": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map10": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map11": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map12": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map13": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map14": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map15": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map16": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map17": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map18": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map19": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map20": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map21": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map22": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map23": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map24": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map25": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map26": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map27": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map28": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	},
	"Map29": {
		"path": "res://Scenes/Maps/Map1.tscn",
		"waves": [
			[
				{
					"name": "BlueTank",
					"waitTime": 2.0,
				}
			]
		]
	}
}

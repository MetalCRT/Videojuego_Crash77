extends Node
## Global Sensor

@export var mouse: Texture2D

#Arrow sensors
var sensor_ArrowUp = 0
var sensor_ArrowLeft = 0
var sensor_ArrowDown = 0
var sensor_ArrowRight = 0

#Contenedor
var score = 0
var shootqueue = 0
var focus_char = 'Gallardo'
# hacer global/booleano para marcar si puedo poner personaje, que sea false cuando pongo uno y true cuando selecciono uno
var can_select = 0
var posicion_libre = null
var level = 0

var chart_level_1 = [0.65,"left",0.4,"down",0.4,"right",
0.4,"left",0.4,"down",0.4,"right",
0.4,"left",0.4,"down",0.4,"right",
0.4,"left",0.35,"down",0.1,"up",
0.2,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.1,"up",
0.2,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.1,"up",
0.3,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.35,"right",
0.4,"left",0.35,"down",0.1,"up",
0.35,"left",0.4,"right",0.35,"left",
0.35,"up",0.35,"down",0.35,"up",
0.35,"left",0.4,"right",0.35,"left",
0.3,"up",0.35,"down",0.25,
0.35,"left",0.4,"right",0.35,"left",
0.35,"up",0.35,"down",0.35,"up",
0.35,"left",0.4,"right",0.35,"left",
0.3,"up",0.35,"down",0.25,
0.2,"left",0.35,"down",0.35,"up",
0.35,"right",0.35,"up",0.35,"down",
0.35,"left",0.35,"down",0.35,"up",
0.35,"right",0.35,"up",0.35,"down",
0.35,"left",0.35,"down",0.35,"up",
0.35,"right",0.35,"up",0.35,"down",
0.35,"left",0.35,"down",0.35,"up",
1.01,"left","right",1.3,"up","down",
1.3,"left","up", 1.1,"right","down",
 0.9,"down","left", 1.1,"right","up",
1.1,"left","right",1.1,"down","up",
0.2,"left",0.2,"down",0.2,"up",0.2,"right",
0.4,"left","down",0.4,"down","up",0.4,"up","right",
1.1,"up","right",0.4,"down","up",0.4,"left","down",
0.7,"left","right",0.4,"left","up",0.4,"right","up",0.4,"left","right",
1.1,"left","down",0.4,"right","up",0.4,"left","up",0.4,"down","right",
0.5,"left",0.5,"right",
0.5,"left","up",0.45,"left",0.45,"down",0.45,"right",0.45,"up",
0.45,"down",0.45,"down",0.45,"up",0.45,"up",
0.6,"left",0.4,"right",0.4,"left",0.35,"right",
0.3,"left",0.3,"down",0.3,"up",0.3,"right",
0.3,"left",0.3,"down",0.3,"up",0.3,"right",0.3,"down",
0.3,"left",0.3,"down",0.7,"down",0.3,"up",0.3,"right",
0.25,"left",0.3,"down",0.3,"left",0.3,"down",0.3,"up",0.3,"right",
0.3,"up","right",0.5,"left","down",1,
"right",0.4,"down",0.4,"up",0.25,"left",0.4,
"left","right",0.5,"down",0.5,"up",1.5,"left","up","right",
0.9,"right",1.0,"left","down",0.8,"up","left",
1.8,"right",0.3,"left",1.8,"down",0.3,"up",
1.5,"left",0.3,"up",1.5,"down",0.3,"right",
1.5,"down",0.3,"up",1.5,"up",0.3,"down",
1.5,"left",0.3,"right",0.4,
"left",0.4,"down",0.4,"up",0.4,"right",0.4,
"left",0.4,"down",0.4,"up",0.4,"right",0.4,
"left",0.4,"down",0.4,"up",0.4,"right",0.4,
"right",0.3,"up",0.3,"down",0.3,"left",0.3,
"right",0.3,"up",0.3,"down",0.3,"left",0.3,
"right",0.35,"up",0.35,"down",0.35,"left",0.35,
"right",0.35,"up",0.35,"down",0.35,"left",0.35,
"right",0.35,"up",0.35,"down",0.35,"left",1.2,
"up",0.35,"down",0.4,"left",0.3,"right",0.4,
"left",0.3,"right",0.6,"down",0.5,"up",
0.6,"right",0.9,"left",0.3,"right","down",0.5,
"up","left",0.3,"down","left",1.2,
"up",0.35,"down",0.4,"left",0.3,"right",0.4,
"left",0.3,"right",0.6,"down",0.5,"up",
0.6,"right",0.9,"left",0.3,"right","down",0.6,
"up","left",0.3,"down"
]

var enemy_chart_level_1 = ["a",7,"b",7,"c",7,"d",
5,"a","d",5,"b","c",8,"c","d",6,"l","k","i","j",5,
"a",1,"a",1,"a",1,"a",1,"a",4,
"b",1,"b",1,"b",1,"b",
"l","k",1,"c","d",1,"d","c",4,
"i","j",1,"c","d",1,"a","b",1,"c","d",
4,"e","f",2,"e","f",2,"b",5,
"b",0.1,"a",0.1,"b",0.1,"a",5,
4,"g","h",2,"g","h",2,"d",5,
"d",0.1,"c",0.1,"d",0.1,"c",0.1,
]

#Lofi es 102 bpm = 1.7 bps = 0.58 diferencia
var chart_level_2 = [3.0,"left",0.58,"down",0.58,"hup",
	0.58, "right", 0.58, "hleft", 1.16, "down", 1.16, "up",
	0.58,"down","up",0.58,"hleft",0.58,"left","right",0.58,"hup",
	0.58,"down",0.58,"right",0.58,"down",0.58,"right",1.16,
	"left",0.58,"hup",0.58,"down",0.58,"hright",0.58,
	"left",0.6,"hup",0.6,"right", 0.54, "hleft", "right",
	0.58,"up",0.58,"down",0.58,"right", 1.16,
	"left",0.58,"right",0.58,"hleft",0.58,"right",0.58,"hleft",1.36,
	"right",0.4,"down",0.3,"hup",0.58,1.16,"down",1.16,"hleft",0.58,
	"right",0.58,"hup",0.4,"down",0.70,"hleft", 1.46,"down",0.96,"up",1.16,
	"hdown",1.16,"left",1.16,"hright",1.16,"up","down",0.58,"left",0.58,"hright",0.22, #A tiempo
	0.4, "down","left",0.47,"up","hright",0.58,"hup",0.64,"down","left",0.29,"left",
	0.29,"down",0.29,"up",0.29,"right",0.29,"hleft",0.29,"hdown",0.29,"hup",0.29,"hright",0.29,
	"left",0.29,"hdown",0.29,"up",0.29,"hright",1.16,"hleft",0.29,"down",0.29,"hup",0.29,"right",
	1.16, "up","down",0.59,"down",0.59,"hup",1.0,"left","right",1.16,"hup","hdown",1.0,"left",
	0.58,"right",0.58,"down",0.58,"up",0.58,"left",0.90,"hup",0.58,"down",0.58,"hleft",0.58,
	"hright",0.58,"down",0.58,"hleft",0.58,"hright", 0.9,"down","left", 1.1,"right","up",
	1.1,"left","right",1.1,"down","up",1.1,"hright","hup",1.1,"left","right",1.1,"hdown","hup",
	0.55,"right",0.55,"hleft",0.55,"up",0.55,"hdown",3.0,"up",0.29,"left",0.29,"hup",0.29,
	"hdown","right",1.16,"left","up","right",1.16,"hleft","hright",1.16,"up","hdown",
	1.16,"right","hdown",1.16,"hright","up",1.16,"hup","down",1.16,"hright","down",1.16,
	"left","up",1.16,"hdown","left",1.16,"hleft","right",1.16,"up","hdown",1.16,"hdown",
	"left",1.16,"up","hright",0.58,"up",0.29,"down",0.58,"left",0.29,"right",
	0.29,"left",0.29,"hdown",0.29,"up",0.29,"right",0.29,"left",1.58,"hdown",0.4,
	"left",0.29,"right",0.35,"down",0.29,"hup",0.35,"left",0.29,"hdown",0.35,"right",1.16,
	"left","up",1.16,"hdown","left",1.16,"hleft","right",1.16,"left","down","up","right",1.16,
	1.16,"left",0.5,"up",0.4,"hright",0.7,"down",0.29,"up","left",0.29,0.58,"hleft",0.29,"right",0.58,
	"hdown",0.58,"hup","right",0.6,"up","hdown",0.58,"left",0.29,"right",0.29,"down",0.29,"up",0.58,
	"hup","down",0.29,"left",0.29,"up",0.58,"hright",0.58,"hup",0.58,"hdown",0.58,"hleft",1.16,"up","left",
	1.16,"hup","hleft",1.16,"down","right",0.58,"left",0.58,"hdown","hright",0.29,"up",
	0.29,"down",0.4,"left",0.29,"right",0.5,"up",0.5,"hdown",0.3,"left",1.16,"hup","hdown","hright",
	1,"up","down","left",1.16,"up","down",1.16,"left","right"
	
	
	
]

var enemy_chart_level_2 = ["a",7,"b",7,"c",7,"d",10,"a","b",5,"b","d",2,"a","c",8,
	"b","c",7,"a","d",8,"b",1,"b",5,"a",1,"a",5,"d","b",1,"d","b",5,"a","b","c","d",
	5,"a","b","c","d", 4,"a","b","c","d","a",5,
4,"g","h",2,"g","h",2,"d",5,"b","c",6,"a","d",5,
"a","d",3,"f",4,"a","b"
	
]



func _ready():
	if mouse:
		Input.set_custom_mouse_cursor(mouse,0,Vector2(54,54))

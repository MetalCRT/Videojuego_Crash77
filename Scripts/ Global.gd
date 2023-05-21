extends Node
## Global Sensor

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
0.4,"left",0.35,"down",0.1,"up"
]

var enemy_chart_level_1 = ["a",7,"b"]

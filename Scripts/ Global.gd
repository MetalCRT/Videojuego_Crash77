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

var chart_level_1 = ["left",0.5,"down",0.5,"up",0.5,"right"]

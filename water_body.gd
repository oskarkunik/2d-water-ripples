extends Node2D


# The spring stiffness constant
var k: float = 0.015

# The spring dampening value
var d = 0.03

@export var spread = 0.0002

var springs = []


func _ready():
	for i in get_children():
		springs.append(i)

	splash(2, 5)

func _physics_process(_delta: float) -> void:
	for i in get_children():
		i.water_update(k, d)

	var left_deltas = []
	var right_deltas = []

	# Set initial velocities to 0
	for i in range(springs.size()):
		left_deltas.append(0)
		right_deltas.append(0)

	for i in range(springs.size()):
		if i > 0:
			left_deltas[i] = spread * (springs[i].height - springs[i-1].height)
			springs[i-1].velocity += left_deltas[i]

		if i < springs.size() - 1:
			right_deltas[i] = spread * (springs[i].height - springs[i+1].height)
			springs[i+1].velocity += right_deltas[i]


func splash(index, speed):
	if index >= 0 and index < springs.size():
		springs[index].velocity += speed


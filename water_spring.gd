extends Node2D

# The spring's current velocity
var velocity: int = 0

# The force being applied to the string
var force: int = 0

# The current height of the spring
var height: float = position.y

# The natural position of the spring
var target_height: float = position.y + 200

# The spring stiffness constant
var k: float = 0.04

# The spring dampening value
var d = 0.04


func water_update(spring_constant, dampening):
	# This function applies the Hooke's Law force to the spring
	# This function will be called in each frame

	# Update the height based on current position
	height = position.y

	# How far the spring is currently extended
	var x = height - target_height

	var loss = -dampening * velocity

	# Hooke's Law implementation for spring behavior
	force = - spring_constant * x + loss

	# Apply the force to velocity
	velocity += force

	# Move the pring
	position.y += velocity

func _physics_process(_delta: float) -> void:
	water_update(k, d)

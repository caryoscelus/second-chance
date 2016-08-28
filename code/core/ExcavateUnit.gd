extends "Unit.gd"

const Resources = preload("Resources.gd")

const WORKERS_PER_ENGINEER = 16
const ENGINEER_BONUS = 1.0

const DIG_STEPS = 4

# TODO: depend on area
const DIG_GOLD = 256
const DIG_ROCKET = 1/64
const DIG_NUCLEAR = 1/64
const DIG_COMPUTER = 2

func _init():
	type = "excavate"

func work():
	var resources = Resources.new()
	
	var productivity = worker_power() * engineer_bonus()
	var coeff = productivity / DIG_STEPS * 2 # so that mean is correct
	
	for step in range(DIG_STEPS):
		resources.gold += DIG_GOLD*randf()*coeff
		resources.rocket += DIG_ROCKET*randf()*coeff
		resources.nuclear += DIG_NUCLEAR*randf()*coeff
		resources.computer += DIG_COMPUTER*randf()*coeff
	
	return resources

func worker_power():
	return get_power(workers)

func engineer_bonus():
	var can_handle = get_power(engineers) * WORKERS_PER_ENGINEER
	var handled = min(can_handle, get_amount(workers))
	return 1.0 + ENGINEER_BONUS*(handled/get_amount(workers))

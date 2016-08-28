extends "Unit.gd"

const Resources = preload("Resources.gd")

const WORKERS_PER_ENGINEER = 16
const ENGINEER_BONUS = 1.0

const DIG_STEPS = 4

# TODO: depend on area
const DIG_GOLD = 256
const DIG_ROCKET = 1.0/64
const DIG_NUCLEAR = 1.0/64
const DIG_COMPUTER = 2

func _init():
	type = "excavate"

func work():
	var resources = Resources.new()
	
	var productivity = worker_power() * engineer_bonus()
	var coeff = productivity / DIG_STEPS * 2 # so that mean is correct
	
	var digged_gold = 0
	var digged_rocket = 0
	var digged_nuclear = 0
	var digged_computer = 0
	for step in range(DIG_STEPS):
		digged_gold += DIG_GOLD*randf()*coeff
		digged_rocket += DIG_ROCKET*randf()*coeff
		digged_nuclear += DIG_NUCLEAR*randf()*coeff
		digged_computer += DIG_COMPUTER*randf()*coeff
	digged_gold = round(digged_gold)
	digged_rocket = round(digged_rocket)
	digged_nuclear = round(digged_nuclear)
	digged_computer = round(digged_computer)
	write_log("digged: %s gold, %s rockets, %s nuclear weapons, %s computers"%[digged_gold, digged_rocket, digged_nuclear, digged_computer])
	resources.gold += digged_gold
	resources.rocket += digged_rocket
	resources.nuclear += digged_nuclear
	resources.computer += digged_computer
	
	return resources

func worker_power():
	return get_power(workers)

func engineer_bonus():
	if not get_amount(workers):
		return 1.0
	var can_handle = get_power(engineers) * WORKERS_PER_ENGINEER
	var handled = min(can_handle, get_amount(workers))
	return 1.0 + ENGINEER_BONUS*(handled/get_amount(workers))

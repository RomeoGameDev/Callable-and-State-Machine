extends Node

@onready var idle_timer: Timer = $IdleTimer
@onready var run_timer: Timer = $RunTimer

var state_machine: CallableStateMachine = CallableStateMachine.new()


func _ready() -> void:
	state_machine.add_state(state_spawn, enter_state_spawn, Callable())
	state_machine.add_state(state_idle, enter_state_idle, leave_state_idle)
	state_machine.add_state(state_run, enter_state_run, leave_state_run)
	state_machine.set_initial_state(state_spawn)
	idle_timer.timeout.connect(_idle_timer_timeout)
	run_timer.timeout.connect(_run_timer_timeout)

#TIMER SINGAL
func _idle_timer_timeout() -> void:
	print(" Idle Timeout")
	state_machine.change_state(state_idle)

func _run_timer_timeout() -> void:
	print(" Run Timeout")
	state_machine.change_state(state_run)


#SPAWN
func state_spawn() -> void:
	print("  State spawn")

func enter_state_spawn() -> void:
	print("  Enter state spawn")


#IDLE
func enter_state_idle() -> void:
	print("  Enter state idle")

func state_idle() -> void:
	print("  State idle")

func leave_state_idle() -> void:
	print("  Leave state idle")


#RUN
func enter_state_run() -> void:
	print("  Enter state run")

func state_run() -> void:
	print("  State run")

func leave_state_run() -> void:
	print("  Leave state run")

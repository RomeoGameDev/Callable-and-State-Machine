class_name CallableStateMachine

var state_dictionary: Dictionary = {}
var current_state: String


func add_state(normal_state_callable: Callable, enter_state_callable: Callable, leave_state_callable: Callable):
	state_dictionary[normal_state_callable.get_method()] = {
		"normal": normal_state_callable,
		"enter": enter_state_callable,
		"leave": leave_state_callable
	}

	print(state_dictionary)


func set_initial_state(state_callable: Callable) -> void:
	var state_name = state_callable.get_method()
	print("Set initial state: " + state_name)
	
	if state_dictionary.has(state_name):
		_set_state(state_name)
	else:
		push_warning("No state with name " + state_name)


func _set_state(state_name: String) -> void:
	if current_state:
		var leave_callable = state_dictionary[current_state].leave as Callable
		if !leave_callable.is_null():
			leave_callable.call()
			print("Leaving from " + current_state + " with metod: " + leave_callable.get_method())

	current_state = state_name
	var enter_callable = state_dictionary[current_state].enter as Callable
	if !enter_callable.is_null():
		enter_callable.call()
		print("Entering to " + current_state + " with metod: " + enter_callable.get_method())


func change_state(state_callable: Callable) -> void:
	var state_name = state_callable.get_method()
	if state_dictionary.has(state_name):
		print("Initializing state change from " + current_state + " to state: " + state_name)
		_set_state.call_deferred(state_name)
	else:
		push_warning("No state with name: " + state_name)


func update() -> void:
	if current_state != null:
		(state_dictionary[current_state].normal as Callable).call()

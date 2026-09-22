extends Control

signal some_signal

func _ready() -> void:
	visible = false
	some_signal.connect(some_func)
	
	# МАГИЯ ДЛЯ ПАУЗЫ: Разрешаем этому UI работать, даже когда вся игра заморожена!
	process_mode = Node.PROCESS_MODE_ALWAYS

func some_func() -> void:
	pass

func _process(_delta: float) -> void:
	# Убрали постоянный спам emit_signal из process!
	
	# Исправь 'escape' на точное имя из твоего Input Map
	if Input.is_action_just_pressed('escepe'): 
		if visible:
			# Если меню БЫЛО ВИДНО, значит мы ВЫХОДИМ из паузы обратно в игру
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			visible = false # ОШИБКА ИСПРАВЛЕНА: тут должно быть false, чтобы спрятать меню!
			get_tree().paused = false
		else:
			# Если меню БЫЛО СКРЫТО, значит мы ВКЛЮЧАЕМ паузу
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			visible = true
			get_tree().paused = true


func _on_restart_pressed() -> void:
	# ВАЖНО: Перед перезапуском сцены обязательно снимаем паузу,
	# иначе новый уровень загрузится сразу замороженным!
	get_tree().paused = false 
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	get_tree().quit()

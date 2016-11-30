extends Panel

# class member variables go here, for example:
# var a = 2
var options
var selfOp = 0.0
var label

var pressed = false
var mouse_enter = false
var object_dragged = false
var pos = get_global_mouse_pos()
var pressed_position

func _fixed_process(delta):
	if pressed == true:
		pos = get_global_mouse_pos()
		set_global_pos(pos - pressed_position)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	options = get_node("Container/OptionsContainer")
	label = get_node("Container/Label")
	options.hide()
	set_self_opacity(selfOp)


func _on_Panel_mouse_enter():
	set_self_opacity(1.0)


func _on_Panel_mouse_exit():
	set_self_opacity(selfOp)


func _on_Panel_focus_exit():
	set_self_opacity(selfOp)


func _on_Panel_focus_enter():
	set_self_opacity(1.0)


func _on_Container_mouse_enter():
	set_self_opacity(1.0)


func _on_Container_mouse_exit():
	set_self_opacity(selfOp)


func _on_Container_input_event( ev ):
	if ev.type == InputEvent.MOUSE_BUTTON:
		if ev.button_index == BUTTON_RIGHT and ev.pressed :
			if options.is_visible():
				options.hide()
			else:
				options.show()
		elif ev.button_index == BUTTON_LEFT and ev.pressed:
			pressed = true
			print(ev)
			pressed_position = ev.pos
		elif ev.button_index == BUTTON_LEFT:
			pressed = false


func set_label(text):
	label.set_text(text)

extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var file
var opened_file
var text_node
var line = 0
var row = 0
var spawn_pos

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
	spawn_pos = get_node("SpawnPos").get_global_pos()
	text_node = preload("res://Nodes/Labe2l.tscn") #preload("res://shoot.tscn").instance()
	#set filepath
	file = File.new()
	opened_file = file.open("res://TextFiles/test.txt" , file.READ)



func _on_Button_pressed():
	var new_node = text_node.instance() #hacer la logica de la posicion
	new_node.set_global_pos(spawn_pos + Vector2(line * 150  , row * 60))
	line = line + 1
	if line > 6:
		row = row + 1
		line = 0
	add_child(new_node)
	new_node.set_label(file.get_line())


func _on_Button_2_pressed():
	line = 0
	row = row + 1


func _on_Button_3_pressed():
	var numberWords = rand_range(20.0 , 40.0)
	var i = 0
	while i < numberWords:
		_on_Button_pressed()
		i = i + 1
		if (line > 4):
			if (randi() % int(floor(numberWords)) ) < 20:
				row = row + 1
				line = 0
		
	print(numberWords)

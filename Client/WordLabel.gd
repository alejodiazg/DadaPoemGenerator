extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass



func _on_ColorPicker_color_changed( color ):
	set('custom_colors/font_color' , color)


func _on_SizeScrollBar_value_changed( value ):
	set('rect/scale' , Vector2(0.3+ (value / 100) , 0.3+ (value / 100)))
	#get("custom_fonts/font").set_size(10 + (value * 10))
	#print(value)

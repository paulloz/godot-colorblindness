@tool
@icon("res://addons/paulloz.colorblindness/colorblindness.svg")
class_name Colorblindness
extends CanvasLayer

enum TYPE { None, Protanopia, Deuteranopia, Tritanopia, Achromatopsia }

@export var Type: TYPE = TYPE.None:
	set(value):
		if rect.material:
			rect.material.set_shader_parameter("type", value)
		else:
			temp = value
		Type = value
		
var temp = null

var rect := ColorRect.new()


func _ready():
	self.add_child(self.rect)

	self.rect.custom_minimum_size = self.rect.get_viewport_rect().size
	self.rect.material = load("res://addons/paulloz.colorblindness/colorblindness.material")
	self.rect.set_mouse_filter(Control.MOUSE_FILTER_IGNORE)
	if self.temp:
		self.Type = self.temp
		self.temp = null

	self.get_tree().root.size_changed.connect(_on_viewport_size_changed)

func _on_viewport_size_changed():
	self.rect.rect_min_size = self.rect.get_viewport_rect().size

tool
class_name Colorblindness, "res://addons/paulloz.colorblindness/colorblindness.svg"
extends CanvasLayer

enum TYPE { None, Protanopia, Deuteranopia, Tritanopia, Achromatopsia }

export(TYPE) onready var Type = TYPE.None setget set_type
var temp = null

var rect = ColorRect.new()

func set_type(value):
    if rect.material:
        rect.material.set_shader_param("type", value)
    else:
        temp = value
    Type = value

func _ready():
    self.add_child(self.rect)

    self.rect.rect_min_size = self.rect.get_viewport_rect().size
    self.rect.material = load("res://addons/paulloz.colorblindness/colorblindness.material")
    self.rect.set_mouse_filter(Control.MOUSE_FILTER_IGNORE)
    if self.temp:
        self.Type = self.temp
        self.temp = null

    self.get_tree().root.connect('size_changed', self, '_on_viewport_size_changed')

func _on_viewport_size_changed():
    self.rect.rect_min_size = self.rect.get_viewport_rect().size

tool
extends ColorRect

enum TYPE { None, Protanopia, Deuteranopia, Tritanopia, Achromatopsia }

export(TYPE) onready var Type = TYPE.None setget set_type

func set_type(value):
    if self.material:
        self.material.set_shader_param("type", value)
        Type = value

func _ready():
    self.material = load("res://addons/paulloz.colorblindness/colorblindness.material")
    self.rect_min_size = get_viewport_rect().size

@tool
extends Control
var graph:GraphEdit
var warning:Label
var dialoguesPanel:Panel





func _init() -> void:
	size_flags_vertical = Control.SIZE_EXPAND_FILL
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	warning = Label.new()
	warning.add_theme_font_size_override('font_size',32)
	warning.text = "there's no Dialogue selected , try to add/select one in the file explorer"
	warning.pivot_offset = warning.size /2
	warning.set_anchors_preset(Control.PRESET_CENTER)
	add_child(warning)
	
func addGraph():
	graph = GraphEdit.new()
	graph.name = 'GraphEdit'
	graph.show_grid = true
	graph.size_flags_vertical = Control.SIZE_EXPAND_FILL
	graph.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	add_child(graph)
	pass

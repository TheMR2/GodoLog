@tool
extends VBoxContainer

@onready var dialogue: Button = $Dialogue
@onready var start_dialogue: Button = $StartDialogue
@onready var end_dialogue: Button = $EndDialogue
var click_pos:Vector2

func _ready() -> void:
	dialogue.pressed.connect(NormalDialogue)
	pass

func NormalDialogue():
	var graphNode = preload("res://addons/godoLog/GraphNode/GraphNode.tscn")
	var nodeInst = graphNode.instantiate()
	var graph_edit = get_parent()
	graph_edit.add_child(nodeInst)
	nodeInst.position_offset = (click_pos + graph_edit.scroll_offset) / graph_edit.zoom

	pass

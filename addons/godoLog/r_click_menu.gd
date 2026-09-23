@tool
extends Panel

@onready var dialogue: Button = $RClickMenu/Dialogue
@onready var start_dialogue: Button = $RClickMenu/StartDialogue
@onready var end_dialogue: Button = $RClickMenu/EndDialogue
var click_pos:Vector2

func _ready() -> void:
	dialogue.pressed.connect(NormalDialogue)
	start_dialogue.pressed.connect(StartDialogue)
	end_dialogue.pressed.connect(EndDialogue)
	pass

func NormalDialogue():
	var graphNode = preload("res://addons/godoLog/GraphNode/GraphNode.tscn")
	var nodeInst = graphNode.instantiate()
	var graph_edit = get_parent()
	graph_edit.add_child(nodeInst)
	nodeInst.position_offset = (click_pos + graph_edit.scroll_offset) / graph_edit.zoom
	pass
func StartDialogue():
	var graphNode = preload("res://addons/godoLog/GraphNode/StarterGraphNode.tscn")
	var nodeInst = graphNode.instantiate()
	var graph_edit = get_parent()
	graph_edit.add_child(nodeInst)
	nodeInst.position_offset = (click_pos + graph_edit.scroll_offset) / graph_edit.zoom
	pass
func EndDialogue():
	var graphNode = preload("res://addons/godoLog/GraphNode/EndGraphNode.tscn")
	var nodeInst = graphNode.instantiate()
	var graph_edit = get_parent()
	graph_edit.add_child(nodeInst)
	nodeInst.position_offset = (click_pos + graph_edit.scroll_offset) / graph_edit.zoom
	pass

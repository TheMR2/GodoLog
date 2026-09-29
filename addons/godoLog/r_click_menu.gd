@tool
extends Panel

@onready var dialogue: Button = $RClickMenu/Dialogue
@onready var start_dialogue: Button = $RClickMenu/StartDialogue
@onready var end_dialogue: Button = $RClickMenu/EndDialogue
var click_pos:Vector2
var graph_edit

func _ready() -> void:
	graph_edit = get_parent()
	if graph_edit:
		for child in graph_edit.get_children():
			if child.name == "StarterGraphNode":
				$RClickMenu/StartDialogue.disabled = true
				pass
	dialogue.pressed.connect(NormalDialogue)
	start_dialogue.pressed.connect(StartDialogue)
	end_dialogue.pressed.connect(EndDialogue)
	pass

func NormalDialogue():
	var graphNode = preload("res://addons/godoLog/GraphNode/GraphNode.tscn")
	var nodeInst = graphNode.instantiate()
	graph_edit.add_child(nodeInst)
	nodeInst.position_offset = (click_pos + graph_edit.scroll_offset) / graph_edit.zoom
	queue_free()
	pass
func StartDialogue():
	var graphNode = preload("res://addons/godoLog/GraphNode/StarterGraphNode.tscn")
	var nodeInst = graphNode.instantiate()
	graph_edit.add_child(nodeInst)
	nodeInst.position_offset = (click_pos + graph_edit.scroll_offset) / graph_edit.zoom
	queue_free()
	pass
func EndDialogue():
	var graphNode = preload("res://addons/godoLog/GraphNode/EndGraphNode.tscn")
	var nodeInst = graphNode.instantiate()
	graph_edit.add_child(nodeInst)
	nodeInst.position_offset = (click_pos + graph_edit.scroll_offset) / graph_edit.zoom
	queue_free()
	pass

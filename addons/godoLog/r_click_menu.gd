extends VBoxContainer

@onready var dialogue: Button = $Dialogue
@onready var start_dialogue: Button = $StartDialogue
@onready var end_dialogue: Button = $EndDialogue
var Pos :Vector2
func _ready() -> void:
	dialogue.pressed.connect(NormalDialogue)
	pass

func NormalDialogue():
	print("Cool")
	var graphNode:GraphNode = GraphNode.new()
	graphNode.position_offset = Pos
	get_parent().add_child(graphNode)
	pass

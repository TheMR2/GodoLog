@tool
extends GraphEdit

signal closed

var graph = preload("res://addons/godoLog/Graph/Graph.tscn")
var RClickMenu = preload("res://addons/godoLog/RClickMenu.tscn")
@onready var new_dialogue: Button = $Buttons/NewDialogue
@onready var save: Button = $Buttons/Save
@onready var close: Button = $Buttons/Close

func _ready() -> void:
	new_dialogue.icon = get_theme_icon("New","EditorIcons")
	save.icon = get_theme_icon("Save","EditorIcons")
	close.icon = get_theme_icon("Close","EditorIcons")
	new_dialogue.pressed.connect(NewDialogue)
	close.pressed.connect(Close)
	pass
func NewDialogue():
	get_parent().add_child(graph.instantiate())
	pass
func Close():
	var parent = get_parent()
	queue_free()
	await tree_exited
	parent.emit_signal("Check")
	pass

var lastName:String
var mouseEntered:bool
var right_click_pos:Vector2
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			right_click_pos = get_local_mouse_position()
			var RCMInst = RClickMenu.instantiate()
			RCMInst.click_pos = right_click_pos
			for child in get_children():
				if child.name == lastName:
					right_click_pos = get_local_mouse_position()
					child.global_position = get_global_mouse_position()
					child.click_pos = right_click_pos
					return
			add_child(RCMInst)
			RCMInst.global_position = get_global_mouse_position()
			lastName = RCMInst.name
			pass
		elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			for child in get_children():
				if child.name == lastName and mouseEntered:
					child.queue_free()
					return
			pass
		pass
	pass


func _on_mouse_exited() -> void:
	mouseEntered = false
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	mouseEntered = true
	pass # Replace with function body.


func _on_connection_drag_started(from_node: StringName, from_port: int, is_output: bool) -> void:
	pass # Replace with function body.


func _on_connection_drag_ended() -> void:
	pass # Replace with function body.


func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	connect_node(from_node,from_port,to_node,to_port)
	pass # Replace with function body.


func _on_disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	disconnect_node(from_node,from_port,to_node,to_port)
	print("Cool")
	pass # Replace with function body.


func _on_paste_nodes_request() -> void:
	print("Paste")
	pass # Replace with function body.


func _on_copy_nodes_request() -> void:
	pass # Replace with function body.

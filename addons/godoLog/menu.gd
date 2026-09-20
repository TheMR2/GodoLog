@tool
extends VBoxContainer

@onready var tab_container: TabContainer = $"../TabContainer"
@onready var root: Control = $".."
var graph = preload("res://addons/godoLog/Graph/Graph.tscn")
func CreateNewDialogue():
	var graphInst = graph.instantiate()
	tab_container.add_child(graphInst)
	root.childCheck()
	pass
func OpenDialogueFile():
	pass
func Support():
	OS.shell_open('https://www.patreon.com/The_MR/posts/support-157148855?utm_medium=clipboard_copy&utm_source=copyLink&utm_campaign=postshare_creator&utm_content=join_link')
	pass
func SupportMemperShip():
	OS.shell_open('https://www.patreon.com/15490533/join')
	pass
func SeeOtherProjects():
	pass

@tool
extends Control

@onready var menu: VBoxContainer = $Menu
@onready var create_new_dialogue: Button = $Menu/CreateNewDialogue
@onready var open_dialogue_file: Button = $Menu/OpenDialogueFile
@onready var support: Button = $Menu/HBoxContainer/Support
@onready var support_2: Button = $Menu/HBoxContainer/Support2
@onready var see_other_projects: Button = $Menu/SeeOtherProjects
@onready var tab_container: TabContainer = $TabContainer


func _ready() -> void:
	tab_container.connect("Check", childCheck)
	create_new_dialogue.icon = get_theme_icon("Add","EditorIcons")
	open_dialogue_file.icon = get_theme_icon("New","EditorIcons")
	support.icon = get_theme_icon("Favorites","EditorIcons")
	support_2.icon = get_theme_icon("Heart","EditorIcons")
	see_other_projects.icon = get_theme_icon("Tools", "EditorIcons")
	pass

func childCheck():
	await get_tree().process_frame
	if tab_container.get_child_count() > 0:
		menu.hide()
	else:
		menu.show()
	pass
	

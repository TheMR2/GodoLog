@tool
extends Button
class_name LoadButton
var window : FileDialog
func _pressed() -> void:
	window = FileDialog.new()
	window.file_selected.connect(fileSelected)
	window.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	add_child(window)
	window.popup()
	pass
func fileSelected(dir:String):
	text = dir
	pass

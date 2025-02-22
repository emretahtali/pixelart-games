/// @desc AddTextBox(line, avatar, face)
/// @arg line satır numarası
/// @arg avatar (yoksa 0)
/// @arg face
function NewTextBox(argument0, argument1, argument2) {

	global.textbox = true;
	oTextBox.line[0] = argument0;
	oTextBox.avatar[0] = argument1;
	oTextBox.face[0] = argument2;



}

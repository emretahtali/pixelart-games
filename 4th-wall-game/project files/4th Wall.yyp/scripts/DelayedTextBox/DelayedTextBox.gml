/// @desc DelayedTextBox(line, avatar, face)
/// @arg line satır numarası
/// @arg avatar (yoksa 0)
/// @arg face
function DelayedTextBox(argument0, argument1, argument2) {

	var i = array_length_1d(oTextBox.delayed_line);
	if (oTextBox.delayed_line[0] == 0) i --;
	oTextBox.delayed_line[i] = argument0;
	oTextBox.delayed_avatar[i] = argument1;
	oTextBox.delayed_face[i] = argument2;


}

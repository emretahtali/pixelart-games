/// @desc NewToTextBox(line, avatar, face)
/// @arg line satır numarası
/// @arg avatar (yoksa 0)
/// @arg face
function AddToTextBox(argument0, argument1, argument2) {

	var i = array_length_1d(oTextBox.line);
	oTextBox.line[i] = argument0;
	oTextBox.avatar[i] = argument1;
	oTextBox.face[i] = argument2;


}

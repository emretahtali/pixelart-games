/// @desc ReadFileLine(fname,line)
/// @arg fname Yazının Yazdığı Dosya Adı
/// @arg line Yazının Yazdığı Satır Numarası
/// @arg dirname Yazının Bulunduğu Klasör (klasörde değilse sıfır yaz.)
function ReadFileLine(argument0, argument1, argument2) {

	// !!! _ln_ yazarsanız alt satıra geçer. (\n yerine kullanılacak.)
	// !!! _ch_ yazarsanız seçim moduna geçer. (bkz: NewTextBox() scripti)

	if (argument2 != 0) && (file_exists(argument2 + "\\" + argument0)) && (directory_exists(working_directory + argument2))
	{
		var file = file_text_open_read(argument2 + "\\" + argument0);
		for (var j = 1; j < argument1; j++) file_text_readln(file);
		var txt = string_replace_all(file_text_read_string(file), "_ln_", "\n");
		file_text_close(file);
		return txt;
	}
	else
	{
		var file = file_text_open_read(argument0);
		for (var j = 1; j < argument1; j++) file_text_readln(file);
		var txt = string_replace_all(file_text_read_string(file), "_ln_", "\n");
		file_text_close(file);
		return txt;
	}



}

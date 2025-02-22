/// @desc StringNextLine(max, text)
/// @arg max Satır başına gelen maximum karakter
/// @arg text Metin
function StringNextLine(argument0, argument1) {

	var txt = argument1;
	var txt_ = txt;
	var newst = 1;

	for (var i = 0; i < string_count(" ", txt_); i++)
	{
		if (string_count("*", txt) == 0) txt = string_replace(txt, " ", "*");
		if (string_count(" ", txt) != 0)
		{
			a = string_pos(" ", txt) + string_count("\n", txt);
			if ((a - newst) + 1 > argument0)
			{
				newst = string_pos("*", txt) + 2;
				txt = string_replace(txt, "*", "\n");
			}
			else
			{
				txt = string_replace(txt, "*", "+");
				txt = string_replace(txt, " ", "*");
			}
		}
	}
	txt = string_replace_all(txt, "+", " ");
	txt = string_replace_all(txt, "*", " ");

	return(txt);


}

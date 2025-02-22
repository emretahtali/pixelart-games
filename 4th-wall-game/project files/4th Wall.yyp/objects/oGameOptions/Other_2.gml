randomise();

#region DİLLER

if (!directory_exists("Language")) directory_create("Language");

#region İNGİLİZCE

if (!file_exists("Language\\" + "en.sav"))  && (directory_exists("Language"))
{
	var file = file_text_open_write("Language\\" + "en.sav");
	file_text_write_string(file, "hold shift to skip");
	file_text_writeln(file);
	file_text_write_string(file, "Look around.");
	file_text_writeln(file);
	file_text_write_string(file, "Your life is a lie.");
	file_text_writeln(file);
	file_text_write_string(file, "You are more than this.");
	file_text_writeln(file);
	file_text_write_string(file, "Prove it.");
	file_text_writeln(file);
	file_text_write_string(file, "...");
	file_text_writeln(file);
	file_text_write_string(file, "What are you waiting for?");
	file_text_writeln(file);
	file_text_write_string(file, "Wake up.");
	file_text_writeln(file);
	file_text_write_string(file, "Press Any Key to Continue");
	file_text_writeln(file);
	file_text_write_string(file, "Weird dream!");
	file_text_writeln(file);
	file_text_write_string(file, "Though I don't believe in the dreams...");
	file_text_writeln(file);
	file_text_write_string(file, "...this one was like trying warn me.");
	file_text_writeln(file);
	file_text_write_string(file, "Should better be careful!");
	file_text_writeln(file);
	file_text_write_string(file, "It is a beautiful day outside.");
	file_text_writeln(file);
	file_text_write_string(file, "Your bed.");
	file_text_writeln(file);
	file_text_write_string(file, "There is a picture of you on the shelf.");
	file_text_writeln(file);
	file_text_write_string(file, "Your desk.");
	file_text_writeln(file);
	file_text_write_string(file, "Seems like you haven't done your math homework yet.");
	file_text_writeln(file);
	file_text_write_string(file, "A bunch of pink flowers.");
	file_text_writeln(file);
	file_text_write_string(file, "You.");
	file_text_writeln(file);
	file_text_write_string(file, "Another bunch of pink flowers.");
	file_text_writeln(file);
	file_text_write_string(file, "Sink.");
	file_text_writeln(file);
	file_text_write_string(file, "Toilet.");
	file_text_writeln(file);
	file_text_write_string(file, "Shower cabin.");
	file_text_close(file);
}
#endregion

#region TÜRKÇE

if(!file_exists("Language\\" + "tr.sav")) && (directory_exists("Language"))
{
	var file = file_text_open_write("Language\\" + "tr.sav");
	file_text_write_string(file, "geçmek için shift'e basılı tut");
	file_text_writeln(file);
	file_text_write_string(file, "Etrafına bir bak.");
	file_text_writeln(file);
	file_text_write_string(file, "Hayatın bir yalan.");
	file_text_writeln(file);
	file_text_write_string(file, "Sen bundan daha fazlasısın.");
	file_text_writeln(file);
	file_text_write_string(file, "Kanıtla.");
	file_text_writeln(file);
	file_text_write_string(file, "...");
	file_text_writeln(file);
	file_text_write_string(file, "Hala neyi bekliyorsun?");
	file_text_writeln(file);
	file_text_write_string(file, "Uyan.");
	file_text_writeln(file);
	file_text_write_string(file, "Herhangi Bir Tuşa Basınız");
	file_text_close(file);
}
#endregion

#endregion

global.language = "en.sav";

room_goto_next();
img_spd = 45;
c = 3;
film = true;

alarm[0] = img_spd;
i = 0;

spd = 0.12;
letters = 0;

text = ReadFileLine(global.language, 2, "Language");
length = string_length(text);
text_current = "";
w = 0;

spcAllowed = true;
timer = 0;
alarm[1] = 200;

title = false;

j = false;
e = 0;

skipIntro = 0;
skipped = false;

endIntro = false;
/// @desc RoomGoto(room, transtype)
/// @arg room Gitmek istediğiniz odanın indexini veya adını yazınız.
/// @arg transtype Aşağıda belirtilen geçiş numaralarından birini seçiniz.
function RoomGoto(argument0, argument1) {
	//_________________________________________________________________________
	//    0.....Geçiş yok dümdüz bidaki odaya atlar
	//    1.....Ekran kararır
	//    2.....Mavi ekran geçişi
	//_________________________________________________________________________

	if (argument1 == 0) room_goto(argument0);
	else if (argument1 == 1) || (argument1 == 2)
	{
		oTransition.mode = argument1;
		oTransition.rm = argument0;
	}


}

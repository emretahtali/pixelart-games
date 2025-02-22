switch (room)
{
	case r1:
	{
	if (r1first)
	{
	timeline_index = tr1;
	timeline_position = 0;
	timeline_running = true;
	if (timeline_position > 60)
	{
		timeline_running = false;
	}
	r1first = false;
	}
	break;
	}
}
x = oPlayer.x;
y = oPlayer.y;
hsp = oPlayer.hsp;
vsp = oPlayer.vsp;
sprite_index = oPlayer.sprite_index;
image_index = oPlayer.image_index;

if (sign(hsp) != 0) && (sign(image_xscale) != sign(hsp)) image_xscale *= -1;

var xscaletrg;
var yscaletrg;

if ((abs(image_xscale) > 1.19 /*1.198*/) || (land_scale_lock)) && (oPlayer.on_ground)
{
	xscaletrg = sign(image_xscale);
	yscaletrg = sign(image_yscale);
	land_scale_lock = true;
}
else
{
	xscaletrg = (1.2 - ((abs(vsp) / 5) * .5)) * sign(image_xscale);
	yscaletrg = (.8 + ((abs(vsp) / 5) * .3)) * sign(image_yscale);
	land_scale_lock = false;
}

image_xscale = lerp(image_xscale, xscaletrg, .3);
image_yscale = lerp(image_yscale, yscaletrg, .3);
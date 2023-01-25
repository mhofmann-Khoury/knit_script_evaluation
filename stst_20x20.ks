// Build a standard Stockinette Swatch with an alternating tuck cast on
import cast_ons;
width = 20;
height = 20;

with Carrier as c1:{
	cast_ons.alt_tuck_cast_on(width); // Casts on from 0 to width needles on front bed
	for r in range(0, height):{
		in reverse direction:{
			knit Loops; // knits all needles that hold a loop. After cast on this will be needles f0 to f19
		}
	}
}
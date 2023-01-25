// Modify Stockinette code to create a swatch of half-gauge knit purl rib.
// Notes:
// Knit Stitches are made on front bed
// Purl Stitches are made on back bed
// half gauge knit purl patterns will be knit like: f0 b1 f2 b3 ...
import cast_ons;
width = 20;
height = 20;

with Carrier as c1:{
	cast_ons.alt_tuck_cast_on(width); // Casts on from 0 to width needles on front bed
	// todo: modify the stockinette code to create a knit purl rib pattern
	for r in range(0, height):{
		in reverse direction:{
			knit Loops; // knits all needles that hold a loop. After cast on this will be needles f0 to f19
		}
	}
}
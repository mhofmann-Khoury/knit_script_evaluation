// Build a standard Stockinette Swatch with an alternating tuck cast on
import cast_ons;
width = 20;
height = 20;

with Carrier as 1:{
	cast_ons.alt_tuck_cast_on(width);
	// todo: modify the stockinette code to create a knit purl rib pattern
	for r in range(0, height):{
		in reverse direction:{
			knit Loops;
		}
	}
}
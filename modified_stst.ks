// Build a standard Stockinette Swatch with an alternating tuck cast on
import cast_ons;
// todo: Modify the code to make a swatch that is 40 stitches by 10 courses
width = 20;
height = 20;

with Carrier as 1:{
	cast_ons.alt_tuck_cast_on(width);
	for r in range(0, height):{
		in reverse direction:{
			knit Loops;
		}
	}
}
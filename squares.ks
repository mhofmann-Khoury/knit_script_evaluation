// Build a reversible stockinette swatch with 4 checkered squares of different colors
// for example front and back of a 4x4 swatch with stitches marked by sheet number
// Front: 0 0 1 1    Back: 1 1 0 0
//        0 0 1 1          1 1 0 0
//        1 1 0 0          0 0 1 1
//        1 1 0 0          0 0 1 1
import cast_ons;

width = 20;
stripe_width = int(width / 2);
height = 20;

with Gauge as 2:{
    first_sheet = s0;
    first_carrier = c1;
    second_sheet = s1;
    second_carrier = c2;

    cast_on_carrier = c3; // carrier to knit cast on boundary

    with Carrier as cast_on_carrier:{ // Create a cast on boundary
        with Sheet as first_sheet:{ // Cast on to s0 to front bed
            cast_ons.alt_tuck_cast_on(width, is_front=True);
        }
        with Sheet as second_sheet:{ // Cast on to s1 to back bed
            cast_ons.alt_tuck_cast_on(width, is_front=False);
        }
    }

    with Sheet as first_sheet:{ // will modify the layering of needles in s0. Will have implicit effects on needle layering of s1
        push Loops[0: stripe_width] to back; // sets the layer of the first strip of needles to be the back layer. The other layer will be moved to the front as a result
    }
    //equivalent code:
//    with Sheet as second_sheet:{
//        push Loops[0: stripe_width] to front;
//    }

    // knit the bottom 2 squares
    stripe_height = int(height/ 2);
    for r in range(0, stripe_height):{ // Alternate Knitting each sheet with their carrier
        with Carrier as first_carrier, Sheet as first_sheet:{
            in reverse direction:{
                knit Loops;
            }
        }
        with Carrier as second_carrier, Sheet as second_sheet:{
            in reverse direction:{
                knit Loops;
            }
        }
    }

    // todo: write code to switch layering for top 2 squares and knit them


}

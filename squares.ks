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
cast_on_height = 4;

with Gauge as 2:{
    front_sheet = s0;
    front_carrier = c1;
    back_sheet = s1;
    back_carrier = c2;

    cast_on_carrier = c3; // carrier to knit cast on boundary

    with Carrier as cast_on_carrier:{ // Create a cast on boundary
        with Sheet as front_sheet:{ // Cast On the front sheet
            cast_ons.alt_tuck_cast_on(width, is_front=True);
        }
        with Sheet as back_sheet:{ // Back of tube cast on on back <width> needles
            cast_ons.alt_tuck_cast_on(width, is_front=False);
        }
        // knit some stockinette on each sheet in the cast on yarn to stabilize the swatch
        for r in range(0, cast_on_height):{
            with Sheet as front_sheet:{
                in reverse direction:{
                    knit Loops;
                }
            }
            with Sheet as back_sheet:{
                in reverse direction:{
                    knit Loops;
                }
            }
        }
    }

    with Sheet as front_sheet:{ // will modify the layering of needles in the front_sheet. Will have implicit effects on needle layering of back_sheet
        left_square = Loops[0:stripe_width];
        push left_square to back; // sets the layer of the first strip of needles to be the back layer. The other layer will be moved to the front as a result
    }
    //Note Equivalent Alternative code to change order of first stripe on back sheet
//    with Sheet as back_sheet:{ // will modify the layering of needles in the front_sheet. Will have implicit effects on needle layering of back_sheet
//        left_square = Loops[0:stripe_width];
//        push left_square to front; // sets the layer of the first strip of needles to be the back layer. The other layer will be moved to the front as a result
//    }
    stripe_height = int(height / 2);
    for r in range(0, stripe_height):{ // Alternate Knitting each sheet with their carrier
        with Carrier as front_carrier, Sheet as front_sheet:{
            in reverse direction:{
                knit Loops;
            }
        }
        with Carrier as back_carrier, Sheet as back_sheet:{
            in reverse direction:{
                knit Loops;
            }
        }
    }
    // Todo: Modify code to create checkered squares of size stripe_width and stripe_height
}

// Build a reversible stockinette swatch with 2 equal vertical stripes of different colors
import cast_ons;

width = 20;
stripe_width = int(width / 2); // width of each square
height = 20;
stripe_height = int(height / 2); // height of each square
cast_on_height = 4;

front_sheet = 0;
front_carrier = 1;
back_sheet = 1;
back_carrier = 2;

cast_on_carrier = 3; // carrier to knit cast on boundary

with Gauge as 2:{
    first_stripe = Front_Needles[0:stripe_width];
    with Carrier as cast_on_carrier:{
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

    // todo: Modify code to make four squares with checkered colors.
    push first_stripe to back; // sets the layer of the first strip of needles to be the back layer. The other layer will be moved to the front as a result
    for r in range(0, height):{
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
}

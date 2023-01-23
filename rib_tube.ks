// Build a standard KP rib Tube with an alternating tuck cast on
import cast_ons;
width = 20;
height = 20;

front_tube = 0;
back_tube = 1;

with Gauge as 2, Carrier as 1:{ // set Gauge to 2 for 2 sheets
    // todo: modify the stockinette tube code so that both sheets are worked in a knit purl rib pattern
    with Sheet as front_tube:{ // Front of tube cast on on front <width> needles
        cast_ons.alt_tuck_cast_on(width, is_front=True);
    }
    with Sheet as back_tube:{ // Back of tube cast on on back <width> needles
        cast_ons.alt_tuck_cast_on(width, is_front=False);
    }
    for r in range(0, height):{
        with Sheet as front_tube:{
            in reverse direction:{
                knit Loops; // only knits loops in front_tube sheet
            }
        }
        with Sheet as back_tube:{
            in reverse direction:{
                knit Loops; // only knits loops in back_tube sheet
            }
        }
    }
}
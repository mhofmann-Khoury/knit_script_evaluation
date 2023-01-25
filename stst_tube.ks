// Build a standard Stockinette Tube using two sheets
// The front sheet (i.e., s0) will be knit on the front bed and always be in front of the other sheet
// The back sheet (i.e., s1) will be knit on the back bed and always be behind the other sheet
import cast_ons;
width = 20;
height = 20;

with Gauge as 2, Carrier as c1:{ // set Gauge to 2 for 2 sheets
    front_tube = s0; // Sheets are denoted by s and a positive integer. The lower the integer the further forward the sheet will be by default
    back_tube = s1;
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
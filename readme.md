# Knit Scrip User Evaluation Instructions

Thank you for participating in our evaluation of the Knit Script programming language. Your feedback will help us to improve this language and build new systems to support automatic machine knitting.

In this study, we will ask you to perform a variety of tasks in the Knit Script programming language. Our goal is to see how well this language supports common machine knitting practices. All feedback, negative and positive, is important to us and welcomed

# Task 0: Set  in Replit
1. Join the Web IDE set up with this evaluation at [Replit](https://replit.com/join/dsyvmrrjgm-mhofmann)
2. Sign in using Username: `KnitScript`
3. Use the password: `knitscript`

Note: When working with Replit we have set all `*.ks` files to end with the `*.js` extension so that there is syntax highlighting on the knit script language. These are not java script files, however there are some similarities in the syntax.



# Task 1: Knit Script Basics

At anytime during the study you can reference a description of the Knit Script language in this [readme](https://github.com/mhofmann-Khoury/knit_script#readme). You are also welcome to ask the researcher questions however they may not be able to provide answers. You can quit a task or the study at anytime. 

## Review Example Stockinette Swatch Code
The following code in 'stst_20x20.ks' which  generates the knitout instructions for a stockinette square of 20 stitches by 20 rows. Stockinette is a knitted text with all knit-stitches (front-bed stitches).

The imported function `cast_ons.alt_tuck_cast_on` is imported from the Knit Script standard library. It performs an alternating-tuck cast on to the width specified. By default, the cast on is on the front bed. The code reads:

```knit_script
def alt_tuck_cast_on(w, is_front=True):{
	print f"Cast on {w} loops";
	side = Back_Needles;
	if is_front:{
		side = Front_Needles;
	}
	in Leftward direction:{
		tuck side[1:w:2];
	}
	in reverse direction:{
		tuck side[0:w:2];
	}
}
```

## Action 1a: Generate a stockinette square
1. Convert this snippet of code into knitout instructions by running main.py with the program set to `Task.Stst` (line 18)

## Action 1b: Resize the Stockinette Swatch
1. Modify the file named `modified_stst.ks` to make a swatch of stockinette that is 40 stitches wide and 10 courses tall. 
2. Convert `modified_stst.ks` knitout instructions by running main.py with the program set to `Task.Modified_Stst` (line 19)

## Action 1c: Create a Resizable Swatch of Knit-Purl Rib
1. Modify the  `rib.ks` file to create the ribbed swatch. Use a half-gauge knit-purl rib pattern. For example, if you had a width of 4 stitches you would be knitting on needles f0, b1, f2, b3. 
2. Convert `rib.ks` knitout instructions by running main.py with the program set to `Task.Rib` (line 20)

### Hints:
1. Knit stitches are made on the front bed (e.g., `Front_Needles`, `Front_Loops`) while purl stitches are made on the back bed (e.g., `Back_Needles`, `Back_Loops`).
2. You can transfer loops held on needles to the opposite bed using a statement like `xfer <needle list> across`.
3. Knit Script includes common list of needles such as:
   1. `Loops` which include all needles that hold one or more loops.
   2. `Front_Loops` and `Back_Loops` which include all needles currently held on the front or back bed, respectively.
   3. `Front_Needles` and `Back_Needles` which include all needles on the front or back bed, respectively. 
4. You can take slices of a list of needles similar to a Python syntax:
   1. e.g., `Front_Needles[0:width:2]` will give every second front bed needle from 0 to width-1.



# Task 2: Making Tubes with alternating Sheets

Knit Script allows you to think about your knitting as sheets of knitted structures. For example, a tube knit in-the-round is two sheets with the front sheet knitting the front of the tube and the back sheet knitting the back of the tube. Review the code in `stst_tube.ks` that use two sheets (`Gauge as 2`) to knit a stockinette tube.


Working with sheets in knit script will automatically adjust your code to a gauging technique so that each sheet can make use of the front and back bed without conflicting with other sheets. Setting the gauge to 2 causes you to work in a half-gauging schema.

## Action 2: Knit-Purl Ribbed Tube
1. Modify the code in `rib_tube.ks` to create a tube of half-gauge knit purl ribbing.
2. Convert `rib_tube.ks` knitout instructions by running main.py with the program set to `Task.Rib_Tube` (line 21)

### Hints:
1. You do not need to worry about conflicts between the two sheets, just write them separately as we have done in the example stockinette tube code. 
2. Reference your `rib.ks` code to create a half gauged ribbing pattern on each sheet

# Task 3: Layers of Colored Sheets
Sheets can also be used to create layers of different colored yarns and colored patterns. The layering of sheets does not have to remain the same across all stitches. Changing the layer ordering at specific needles will trade out between different colors of fabric creating images. 

Consider the code in `stripes.ks` that creates 2 sheets of with 2 yarn colors. Sheet `s0` is knitted in stockinette (all front bed knits) with carrier `c1`. Sheet `s1` is knitted in reverse stockinette (all back bed knits) with carrier `c2`. By default, all stitches made on `s0` will be in front of `s1` because 0 < 1. 

The push statement `push first_stripe to back;` changes the layering of these two sheet for the needles in `first_stripe`. In this stripe, `s0` will now appear behind `s1`. The remaining working needles will still have `s0` stitches in front of `s1` stitches. This will create two vertical stripes with different colored yarns.


## Action 3: 4 Checkered Squares with Layered Sheets
1. Modify the code in `squares.ks` to create 4 checkered squares by alternating the layering of the two sheets.
2. Convert `squares.ks` knitout instructions by running main.py with the program set to `Task.Squares` (line 22)

# Wrapping Up:
Thank you so much for participating in this study. We may email you with optional follow-up questions. 
# Knit Scrip User Evaluation Instructions

Thank you for participating in our evaluation of the Knit Script programming language. Your feedback will help us to improve this language and build new systems to support automatic machine knitting.

In this study, we will ask you to perform a variety of tasks in the Knit Script programming language. Our goal is to see how well this language supports common machine knitting practices. All feedback, negative and positive, is important to us and welcomed

# Task 0: Set up

## Prerequisites

### Python 3
If you have not already please ensure that you have a version of [Python 3](https://www.python.org/downloads/) installed on your computer. Knit Script is built on Python 3. In this study you will not be writing any Python code, however it will need to be installed for the interpreter to work. We recommend Python 3.11.

### Pip 3
You will also need Pip 3 to install the Knit Script library. This should be available with your Python installation. If you have trouble accessing pip on windows try adding it to your [PATH](https://www.geeksforgeeks.org/how-to-install-pip-on-windows/)

## Clone Knit Script Samples to Your Machine
 You will need access to sample code in this repository for the remaining tasks. You can download all of these files by cloning this repository
```
$ git clone https://github.com/mhofmann-Khoury/knit_script_evaluation.git
```

## Option 1: Install Knit Script from PyPI

The easiest way to install knit_script is to install from PyPI. In your console write:

```
$ pip install knit_script
```

This will install the latest version to your Python Scripts and will install Knit Script's required packages. 

## Option 2: Install Knit Script from GitHub

If you prefer to install modifiable version of Knit Script you can install if from the public GitHub [repository](https://github.com/mhofmann-Khoury/knit_script). 

First navigate to the directory you want to store the code in locally on your machine and clone the repository:

```
$ git clone https://github.com/mhofmann-Khoury/knit_script.git
```

With the repository cloned to your machine install the library with:

```
$ pip install -e .   
```

## Convert Knit Script into Knitout

For the remainder of this study we recommend working in the knit_script_evaluation directory on your computer and from the console. You can convert knit script files into knitout using the following commands:

On Linux and Mac machines:
```
$ knit-script -k <knitout output>.k <knit script input>.ks
```

On Windows machines:
```
$ knit_script.bat -k <knitout output>.k <knit script input>.ks
```


# Task 1: Knit Script Basics

At anytime during the study you can reference a description of the Knit Script language in this [readme](https://github.com/mhofmann-Khoury/knit_script#readme). You are also welcome to ask the researcher questions however they may not be able to provide answers. You can quit a task at anytime. 

## Review Example Stockinette Swatch Code
The following code snippet generates the knitout instructions for a stockinette square of 20 stitches by 20 rows. Stockinette is a knitted text with all knit-stitches (front-bed stitches).

```knit_script
// Build a standard Stockinette Swatch with an alternating tuck cast on
import cast_ons;
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
```

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
Convert this snippet of code into knitout instruction using the following console commands. 

On Linux and Mac machines:
```
$ knit-script -k stst_20x20.k stst_20x20.ks
```

On Windows machines:
```
$ knit_script.bat -k stst_20x20.k stst_20x20.ks
```

## Action 1b: Resize the Stockinette Swatch

Copy the stockinette code into a file named `modified_stst.ks` and change the code to make a swatch of stockinette that is 40 stitches wide and 10 courses tall. 

From command line, run the knit script interpreter to generate the Knitout instructions for your modified code:

On Linux and Mac machines:
```
$ knit-script -k modified_stst.k modified_stst.ks
```

On Windows machines:
```
$ knit_script.bat -k modified_stst.k modified_stst.ks
```

## Action 1c: Create a Resizable Swatch of Knit-Purl Rib

Write your own Knit Script file to create a swatch of variable width (i.e, stitches) and height (i.e., courses) in a knit-purl rib pattern. 

Hints:
1. Knit stitches are made on the front bed (e.g., `Front_Needles`, `Front_Loops`) while purl stitches are made on the back bed (e.g., `Back_Needles`, `Back_Loops`).
2. You can transfer loops held on needles to the opposite bed using a statement like `xfer <needle list> across`.
3. Knit Script includes common list of needles such as:
   1. `Loops` which include all needles that hold one or more loops.
   2. `Front_Loops` and `Back_Loops` which include all needles currently held on the front or back bed, respectively.
   3. `Front_Needles` and `Back_Needles` which include all needles on the front or back bed, respectively. 
4. You can take slices of a list of needles similar to a Python syntax:
   1. e.g., `Front_Needles[0:width:2]` will give every second front bed needle from 0 to width-1.

Create a file called `rib.ks` for your ribbed swatch and generate knit script instructions as follows:
On Linux and Mac machines:
```
$ knit-script -k rib.k rib.ks
```

On Windows machines:
```
$ knit_script.bat -k rib.k rib.ks
```

# Task 2: Making Tubes with alternating Sheets

Knit Script allows you to think about your knitting as sheets of knitted structures. For example, a tube knit in-the-round is two sheets with the front sheet knitting the front of the tube and the back sheet knitting the back of the tube. Review the following [code]() that use two sheets (`Gauge as 2`) to knit a stockinette tube.

```knit_script
// Build a standard Stockinette Tube with an alternating tuck cast on
import cast_ons;
width = 20;
height = 20;

front_tube = 0;
back_tube = 1;

with Gauge as 2, Carrier as 1:{ // set Gauge to 2 for 2 sheets
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
```

## Action 2: Knit-Purl Ribbed Tube
Working with sheets in knit script will automatically adjust your code to a gauging technique so that each sheet can make use of the front and back bed without conflicting with other sheets. Setting the gauge to 2 causes you to work in a half-gauging schema.

Referencing your `rib.ks` file, modify the stockinette tube code to create a tube of knit-purl ribbing in a new file called `rib_tube.ks`. Note that you do not need to worry about conflicts between the two sheets, just write them separately as we have done in the example stockinette tube code. 

Verify your `rib_tube.ks` file by generating knitout instructions. 

# Task 3: Layers of Colored Sheets
Sheets can also be used to create layers of different colored yarns and colored patterns. The layer of sheets does not have to remain the same and changing the layer ordering at specific needles will trade out between different colors of fabric creating images. 

Consider the following code in `2_stripes.ks` that creates 2 sheets of with 2 yarn colors. Sheet 0 is knitted in stockinette (all front bed knits) on carrier 1. Sheet 1 is knitted in reverse stockinette (all back bed knits) on carrier 2. The push statement `push first_stripe to back;` changes the layering of these two sheet for the first half of the working needles. In this stripe, Sheet 0 will appear behind Sheet 1. In the second stipe, Sheet 0 will, by default, appear in front of Sheet 1. This will creat two colored vertical stripes.

```knit_script
// Build a reversible stockinette swatch with 2 equal vertical stripes of different colors
import cast_ons;

width = 20;
stripe_width = int(width / 2);
height = 20;
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
```

## Action 3: 4-Colored Squares with Layered Sheets

By modifying the code in `2_stripes.ks`, create a new file `4_squares.ks` that has 4 checkered squares of the two different yarn colors. Note that you can set needles in a layer to be at the front layer using `push <needles> to front.`

Verify the `4_squares.ks` code by generating knitout instructions.

# Wrapping Up:
Thank you so much for participating in this study. Please send the research a copy of working directory as a zip folder.  We may email you with optional follow-up questions. 
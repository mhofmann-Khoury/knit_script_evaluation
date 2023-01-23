# Knit Scrip User Evaluation Instructions

Thank you for participating in our evaluation of the Knit Script programming language. Your feedback will help us to improve this language and build new systems to support automatic machine knitting.

In this study, we will ask you to perform a variety of tasks in the Knit Script programming language. Our goal is to see how well this language supports common machine knitting practices. All feedback, negative and positive, is important to us and welcomed

# Task 0: Set up

## Prerequisites

### Python 3
If you have not already please ensure that you have a version of [Python 3](https://www.python.org/downloads/) installed on your computer. Knit Script is built on Python 3. In this study you will not be writing any Python code, however it will need to be installed for the interpreter to work. We recommend Python 3.11.

### Pip 3
You will also need Pip 3 to install the Knit Script library. This should be available with your Python installation. If you have trouble accessing pip on windows try adding it to your [PATH](https://www.geeksforgeeks.org/how-to-install-pip-on-windows/)

### Optional Node.js Installation
We will only be generating knitout files in this study but if you wish to make instructions for specific knitting machines (e.g., Shima Seiki, Kniterate) you will need a [Node.js installation](https://nodejs.org/en/download/) and [knitout compilers](https://github.com/textiles-lab/knitout-backend-kniterate).

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

## Windows Only: knit_script.bat
On Windows you will need a copy of [knit_script.bat](https://github.com/mhofmann-Khoury/knit_script/blob/main/knit_script.bat) from the GitHub repository. If you installed your code from GitHub this is already available to you. We recommend [adding the folder knit_script.bat is stored in to your PATH](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/) so that you can access it from any folder. 

# Task 1: Stockinette Square in Knit Script

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

This will generate a knitout file called `modified_ststs.k` in the same directory as modified_stst.ks. The sample code knitout should look something like:

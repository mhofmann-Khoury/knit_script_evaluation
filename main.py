"""Run file for Knit Script User evaluation tasks"""
from enum import Enum

from knit_script.interpret import knitscript_to_knitout_to_dat


class Task(Enum):
    """Enum to track different tasks by file name"""
    Stst = "stst_20x20"
    Modified_Stst = "modified_stst"
    Rib = "rib"
    Stst_Tube = "stst_tube"
    Rib_Tube = "rib_tube"
    Stripes = "stripes"
    Squares = "squares"


program = Task.Stst  # todo: Use this line for Action 1a
# program = Task.Modified_Stst  # todo: Use this line for Action 1b
# program = Task.Rib  # todo: Use this line for Action 1c
# program = Task.Rib_Tube  # todo: Use this line for Action 2
# program = Task.Squares  # todo: Use this line for Action 3
knitscript_to_knitout_to_dat(f"{program.value}.ks", f"{program.value}.k", f"{program.value}.dat", pattern_is_filename=True)
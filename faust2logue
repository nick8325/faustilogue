#!/usr/bin/env python3

import argparse
import json
import tempfile
import subprocess
import os
import sys
import re
import sys
from dataclasses import dataclass

scriptdir = os.path.abspath(os.path.dirname(sys.argv[0]))

parser = argparse.ArgumentParser(
    prog='faust2logue',
    description='Convert a Faust .dsp file to Logue SDK format')

parser.add_argument('filename',
                    help='a .dsp file to convert')
parser.add_argument('-O', '--output-directory',
                    action='store',
                    help='directory where output will be stored')
parser.add_argument('-p', '--platform',
                    action='store',
                    choices=['minilogue-xd', 'prologue', 'nutekt-digital'],
                    default='minilogue-xd',
                    help='platform for manifest.json file')
parser.add_argument('-c', '--control-rate',
                    action='store',
                    default=200,
                    type=int,
                    help='rate in Hz at which control inputs are updated')
parser.add_argument('-r', '--sample-rate',
                    action='store',
                    choices=[48000,24000,12000],
                    default=48000,
                    type=int,
                    help='sample rate in Hz')
parser.add_argument('-t', '--table-size',
                    action='store',
                    default=128,
                    type=int,
                    help='table size used by rdtable')
parser.add_argument('-F', '--faust-args',
                    action='store',
                    default='',
                    help='arguments to be passed to Faust')
parser.add_argument('-m', '--monitor-cpu-load',
                    action=argparse.BooleanOptionalAction,
                    help='monitor CPU load instead of producing audio')

args = parser.parse_args()

sample_rate_factor = 48000 // args.sample_rate
frames_per_control = 48000 // args.control_rate
if not args.output_directory:
    args.output_directory = os.path.dirname(args.filename)

file_base = os.path.splitext(os.path.basename(args.filename))[0]
output_file = args.output_directory + "/" + file_base + ".cpp"
manifest_file = args.output_directory + "/manifest.json"
project_file = args.output_directory + "/project.mk"

# Generate platform.lib and run Faust
with tempfile.TemporaryDirectory() as dir:
    with open(dir + "/platform.lib", "w") as file:
        file.write(f"""
SR = {args.sample_rate};
BS = 1;
tablesize = {args.table_size};
""")

    cmd = ["faust", args.filename,
           "-a", f"{scriptdir}/src/logue.arch",
           "-fm", f"{scriptdir}/src/fastmath.cpp",
           "-I", dir, "-O", dir,
           "-nvi", "-exp10", "-ct", "0", "-mapp", "-os", "-json"] + args.faust_args.split()
    faust = subprocess.run(cmd, stdout=subprocess.PIPE, check=True)
    with open(dir + "/" + os.path.basename(args.filename) + ".json") as file:
        metadata = json.load(file)

# Extract names of variables for UI widgets from buildUserInterface
def get_widget_vars():
  widget_vars = {}
  widget_context = []
  for line in faust.stdout.decode('utf-8').splitlines():
      match = re.match(r"\s*ui_interface->([a-zA-Z]*)\((.*)\);", line)
      if match:
          command, argstr = match.groups()
          args = argstr.split(", ")
          if command in ['openTabBox', 'openHorizontalBox', 'openVerticalBox']:
              label = args[0].replace('"', '')
              widget_context.append(label)
          elif command == 'closeBox':
              widget_context.pop()
          elif command in ['addVerticalSlider', 'addHorizontalSlider', 'addNumEntry']:
              label = args[0].replace('"', '')
              var = args[1].replace('&', '')
              widget_vars[tuple(widget_context + [label])] = var
  return widget_vars

widget_vars = get_widget_vars()

# Extract global information from the metadata
if metadata["inputs"] != 0:
    print("Error: .dsp file must not have any inputs", file=sys.stderr)
    sys.exit(1)
if metadata["outputs"] != 1:
    print("Error: .dsp file must have exactly 1 output", file=sys.stderr)
    sys.exit(1)
module_name = metadata["name"]

# Now go through the UI metadata to construct a list of widgets
@dataclass
class Widget:
    label: str
    var: str
    min: float
    max: float
    init: float
    tooltip: str
    style: str

    def percent(self):
        return self.style == "percentage"

    # See https://github.com/korginc/logue-sdk/pull/28/files
    # TODO: check these!
    def safe_min(self):
        if not self.percent() and self.min <= 0: return 1
        # if self.min < -100: return -100
        # if self.min > 100: return 100
        return self.min

    def safe_max(self):
        return self.max

widgets = []
def find_widgets(widget, context):
    context += (widget["label"],)
    if widget["type"] in ["hgroup", "vgroup", "tgroup"]:
        for child in widget["items"]:
            find_widgets(child, context)
    elif widget["type"] in ["hslider", "vslider", "nentry"]:
        meta = {k: v for dict in widget.get("meta", []) for k, v in dict.items()}
        w = Widget(
            label = widget["label"],
            var = widget_vars[context],
            min = widget["min"],
            max = widget["max"],
            init = widget["init"],
            tooltip = meta.get("tooltip", ""),
            style = meta.get("style", ""))
        widgets.append(w)

for widget in metadata["ui"]:
    find_widgets(widget, ())

# Populate the parameter list
params = {}
for i in range(1, 7):
    for w in widgets:
        if w.label == f"param{i}":
            params[i] = w
nparams = max(0, 0, *params.keys())

# Get the manifest declaration for a given parameter number
def get_param(i):
    if i in params:
        w = params[i]
        percent = "%" if w.percent() else ""
        return [w.tooltip or "Param " + str(i), w.safe_min(), w.safe_max(), percent]
    else:
        return ["Unused", 0, 0, ""]

# Generate the manifest file
manifest = {
    "header": {
        "platform": args.platform,
        "module": "osc",
        "api": "1.1-0",
        "dev_id": 0,
        "prg_id": 0,
        "version": "1.0-0",
        "name": module_name,
        "num_param": nparams,
        "params": [get_param(i) for i in range(1, nparams+1)]}}

with open(manifest_file, "w") as file:
    json.dump(manifest, file)

# Generate the .cpp file
with open(output_file, "w") as file:
    widgets_by_label = {}
    for w in widgets:
        if w.label == 'vel':
            widgets_by_label['velocity'] = w
        else:
            widgets_by_label[w.label] = w

    for param in [
        "key", "freq", "velocity", "gain", "gate",
        "shape", "shiftshape", "lfo", "cutoff", "resonance",
        "param1", "param2", "param3", "param4", "param5", "param6"
    ]:
        if param in widgets_by_label:
            w = widgets_by_label[param]
            file.write(f"#define set_{param}(val) dsp.{w.var} = val\n")
            if param.startswith("param") or param in ["shape", "shiftshape"]:
                file.write(f"#define initial_{param} {w.init}\n")
            if param in ["shape", "shiftshape"]:
                file.write(f"#define {param.upper()}_MIN {w.min}\n")
                file.write(f"#define {param.upper()}_MAX {w.max}\n")
        else:
            file.write(f"#define set_{param}(val)\n")

    file.write(f"""
#define SAMPLE_RATE_FACTOR {sample_rate_factor}
#define FRAMES_PER_CONTROL {frames_per_control}
""")

    if args.monitor_cpu_load:
        file.write("#define MONITOR_CPU_LOAD")

    file.write(faust.stdout.decode('utf-8'))

# Generate the project.mk file
with open(project_file, "w") as file:
    file.write(f"""
PROJECT = {file_base}
UCSRC =
UCXXSRC = {output_file}
UINCDIR =
UDEFS =
ULIB =
ULIBDIR =
""")

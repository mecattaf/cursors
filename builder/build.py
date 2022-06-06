#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
from pathlib import Path

from src.configure import get_config
from src.generator import Info, xbuild, wbuild, build


parser = argparse.ArgumentParser(
    prog="bibata_builder",
    description="'Bibata' cursor build python script.",
)

# Positional Args.
parser.add_argument(
    "platform",
    choices=("windows", "unix", "all"),
    default="all",
    const="all",
    nargs="?",
    help="Set package type, Which you want to build. (default: '%(default)s')",
)

# Optional Args.
parser.add_argument(
    "-p",
    "--png-dir",
    dest="png_dir",
    metavar="PNG",
    type=str,
    default="../bitmaps",
    help="To change pngs directory. (default: %(default)s)",
)

parser.add_argument(
    "-o",
    "--out-dir",
    dest="out_dir",
    metavar="OUT",
    type=str,
    default="../themes",
    help="To change output directory. (default: %(default)s)",
)


parser.add_argument(
    "-xs",
    "--xsizes",
    dest="xsizes",
    metavar="INT",
    nargs="+",
    default=[
        22,
        24,
        28,
        32,
        40,
        48,
        56,
        64,
        72,
        80,
        88,
        96,
    ],
    type=int,
    help="Set pixel-size for xcursor. (default: %(default)s)",
)


parser.add_argument(
    "-ws",
    "--win-size",
    dest="win_size",
    metavar="INT",
    default=24,
    type=int,
    help="Set pixel-size for Windows cursors. (default: %(default)s)",
)


parser.add_argument(
    "-wcs",
    "--win-canvas-size",
    dest="win_canvas_size",
    metavar="INT",
    default=32,
    type=int,
    help="Set pixel-size for Windows cursor's canvas. (default: %(default)s)",
)

# Preparing build
args = parser.parse_args()

bitmaps_dir = Path(args.png_dir)

name = bitmaps_dir.stem
comments = {
    "Bibata-Modern-Yellow": "Yellow Rounded-edge Bibata",
    "Bibata-Original-Yellow": "Yellow Sharp-edge Bibata",
    "Bibata-Modern-Orange": "Orange Rounded-edge Bibata",
    "Bibata-Original-Orange": "Orange Sharp-edge Bibata",
    "Bibata-Modern-Red": "Red Rounded-edge Bibata",
    "Bibata-Original-Red": "Red Sharp-edge Bibata",
    "Bibata-Modern-Magenta": "Magenta Rounded-edge Bibata",
    "Bibata-Original-Magenta": "Magenta Sharp-edge Bibata",
    "Bibata-Modern-Purple": "Purple Rounded-edge Bibata",
    "Bibata-Original-Purple": "Purple Sharp-edge Bibata",
    "Bibata-Modern-Blue": "Blue Rounded-edge Bibata",
    "Bibata-Original-Blue": "Blue Sharp-edge Bibata",
    "Bibata-Modern-Cyan": "Cyan Rounded-edge Bibata",
    "Bibata-Original-Cyan": "Cyan Sharp-edge Bibata",
    "Bibata-Modern-Green": "Green Rounded-edge Bibata",
    "Bibata-Original-Green": "Green Sharp-edge Bibata",
    "Bibata-Modern-Dark": "Dark Rounded-edge Bibata",
    "Bibata-Original-Dark": "Dark Sharp-edge Bibata",
    "Bibata-Modern-Light": "Light Rounded-edge Bibata",
    "Bibata-Original-Light": "Light Sharp-edge Bibata",
}
info = Info(name=name, comment=comments.get(name, f"{name} Cursors"))


x_out_dir = Path(args.out_dir) / name
win_out_dir = Path(args.out_dir) / f"{name}-Windows"

# Windows Canvas & Cursor sizes
win_size: int = args.win_size
win_canvas_size: int = args.win_canvas_size
if win_canvas_size < win_size:
    win_canvas_size = win_size


print(f"Getting '{name}' bitmaps ready for build...")
config = get_config(
    bitmaps_dir,
    x_sizes=args.xsizes,
    win_canvas_size=win_canvas_size,
    win_size=win_size,
)

if args.platform == "unix":
    xbuild(config, x_out_dir, info)
elif args.platform == "windows":
    wbuild(config, win_out_dir, info)
else:
    build(config, x_out_dir, win_out_dir, info)

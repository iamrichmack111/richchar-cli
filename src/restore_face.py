#!/usr/bin/env python3
"""Exact GFPGAN restoration recipe validated for Richchar photo portraits."""
from __future__ import annotations
import argparse
import glob
import os
import time
import cv2
from gfpgan import GFPGANer


def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("--src", required=True)
    p.add_argument("--dst", required=True)
    p.add_argument("--model", required=True)
    p.add_argument("--weight", type=float, default=0.65)
    p.add_argument("--resume", action="store_true")
    return p.parse_args()


def main():
    args = parse_args()
    if not 0 <= args.weight <= 1:
        raise SystemExit("--weight must be between 0 and 1")
    os.makedirs(args.dst, exist_ok=True)

    # Do not alter these defaults without a visual regression test.
    restorer = GFPGANer(
        model_path=os.path.expanduser(args.model),
        upscale=1,
        arch="clean",
        channel_multiplier=2,
        bg_upsampler=None,
    )

    files = sorted(glob.glob(os.path.join(os.path.expanduser(args.src), "*.png")))
    if not files:
        raise SystemExit("No PNG frames found")

    started = time.monotonic()
    completed = 0
    for i, path in enumerate(files, 1):
        out = os.path.join(os.path.expanduser(args.dst), os.path.basename(path))
        if args.resume and os.path.isfile(out) and os.path.getsize(out) > 0:
            completed += 1
        else:
            img = cv2.imread(path)
            if img is None:
                raise RuntimeError(f"Could not read {path}")
            _, _, restored = restorer.enhance(
                img,
                has_aligned=False,
                only_center_face=True,
                paste_back=True,
                weight=args.weight,
            )
            if not cv2.imwrite(out, restored):
                raise RuntimeError(f"Could not write {out}")
            completed += 1

        elapsed = max(time.monotonic() - started, 0.001)
        rate = completed / elapsed
        remain = len(files) - completed
        eta = remain / rate if rate else 0
        print(
            f"\r[4/5] GFPGAN restoring {completed}/{len(files)} "
            f"| {rate:.2f} fps | ETA {eta/60:.1f}m",
            end="",
            flush=True,
        )
    print("\nDone")

if __name__ == "__main__":
    main()

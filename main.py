import argparse
import pathlib
import os
import sys

ROOT = pathlib.Path(__file__).parent

def parse_args():
    projects = []
    for file in ROOT.iterdir():
        if file.name == "lib":
            continue
        if not file.is_dir():
            continue
        projects.append(file.name)

    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--project", choices=projects)
    parser.add_argument("-a", "--action", choices=["export"])
    return parser.parse_args()

def main():
    args = parse_args()

    if args.action == "export":
        r_path = (ROOT / args.project / "export")
        w_path = (ROOT / args.project / "STLs")
        for file in r_path.iterdir():
            cmd = f"openscad -o {str(w_path / file.stem) + '.stl'} --export-format binstl {r_path / file.name}"
            print(f"Running '{cmd}'")
            os.system(cmd)

if __name__ == "__main__":
    main()

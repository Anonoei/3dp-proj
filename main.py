import argparse
import pathlib
import os

ROOT = pathlib.Path(__file__).parent
projects = ["all"]
for file in ROOT.iterdir():
    if file.name in (".git", "lib", "ref"):
        continue
    if not file.is_dir():
        continue
    projects.append(file.name)


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--project", choices=projects)
    parser.add_argument("-a", "--action", choices=["export", "image"])
    return parser.parse_args()

def action_export(args):
    r_path = (ROOT / args.project / "export")
    w_path = (ROOT / args.project / "STLs")
    for file in r_path.iterdir():
        cmd = f"openscad -o {str(w_path / file.stem) + '.stl'} --export-format binstl {r_path / file.name}"
        print(f"Running '{cmd}'")
        os.system(cmd)

def action_image(args):
    path  = (ROOT / args.project)
    cmd = f"openscad -o {path / 'demo.png'} --colorscheme Starnight {path / 'demo.scad'}"
    print(f"Running '{cmd}'")
    os.system(cmd)

def process_args(args):
    if args.action == "export":
        action_export(args)
    elif args.action == "image":
        action_image(args)

def main():
    args = parse_args()
    if args.project == "all":
        for project in projects[1:]:
            args.project = project
            process_args(args)
    else:
        process_args(args)


if __name__ == "__main__":
    main()

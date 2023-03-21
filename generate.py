import json
from pathlib import Path

import yaml


def generate():
    """Generate the data."""
    source = yaml.safe_load(Path("data/foods.yaml").read_text(encoding="utf-8"))
    Path("dist").mkdir(exist_ok=True)
    Path("dist/foods.json").write_text(
        json.dumps(source, sort_keys=True, indent=4), encoding="utf-8"
    )


if __name__ == "__main__":
    generate()

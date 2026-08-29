import ast
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def test_restore_script_parses():
    ast.parse((ROOT / "src" / "restore_face.py").read_text())

def test_exact_recipe_locked():
    text = (ROOT / "src" / "restore_face.py").read_text()
    required = [
        'upscale=1',
        'arch="clean"',
        'channel_multiplier=2',
        'bg_upsampler=None',
        'has_aligned=False',
        'only_center_face=True',
        'paste_back=True',
    ]
    for token in required:
        assert token in text

def test_cli_has_expected_pipeline_stages():
    text = (ROOT / "richchar").read_text()
    for stage in ["[1/5]", "[2/5]", "[3/5]", "[4/5]", "[5/5]"]:
        assert stage in text

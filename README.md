# Richchar CLI

Local-first talking-portrait CLI for Richmack OS. The quality path is locked to the exact Wav2Lip GAN + GFPGAN v1.4 recipe that passed manual visual testing.

## Quick start

```bash
./richchar --doctor

./richchar \
  --image ~/Desktop/black-guy.png \
  --text "Welcome to Richmack OS." \
  --voice-model ~/Desktop/en_US-ryan-high.onnx \
  --output ~/Desktop/richmack-os.mp4
```

For a quick quality check before a long render:

```bash
./richchar \
  --image ~/Desktop/black-guy.png \
  --text "Welcome to Richmack OS." \
  --voice-model ~/Desktop/en_US-ryan-high.onnx \
  --preview-seconds 3 \
  --output ~/Desktop/richmack-preview.mp4
```

## Pipeline

`Piper → Wav2Lip GAN (--nosmooth) → PNG frames → exact GFPGAN v1.4 restore → FFmpeg CRF 14`

The default GFPGAN weight is `0.65`. `--gfpgan-weight` is exposed for controlled A/B tests, but `0.65` is the current quality baseline.

## Resume

Use a stable work directory when you want interrupted frame restoration to resume:

```bash
RICHCHAR_WORKDIR=~/Desktop/richchar-work ./richchar \
  --resume \
  --keep-work \
  --image ~/Desktop/black-guy.png \
  --text "Welcome to Richmack OS." \
  --voice-model ~/Desktop/en_US-ryan-high.onnx \
  --output ~/Desktop/richmack-os.mp4
```

## CI/CD

- CI: Bash syntax, ShellCheck, Ruff, pytest, CLI smoke checks.
- Security: CodeQL for Python, Trivy filesystem scan.
- Dependabot: GitHub Actions and pip dev tooling.
- Release: pushes tagged `v*` create a versioned ZIP GitHub Release artifact.

## External dependencies

This repository does **not** redistribute Wav2Lip, GFPGAN, SadTalker, Piper models, checkpoints, or third-party model weights. Install/use those projects under their own terms. Verify upstream licensing before commercial distribution.

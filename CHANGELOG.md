# Changelog

## v1.1.0 - 2026-08-29

- Locks the validated photorealistic quality pipeline.
- Keeps Wav2Lip GAN with `--nosmooth`.
- Moves the exact GFPGAN v1.4 restoration into a standalone, testable Python module.
- Adds preview rendering, resumable GFPGAN frame restoration, manual face-box support, ETA/progress, and dependency doctor checks.
- Adds CI, CodeQL, Trivy security scanning, Dependabot, release automation, D2 architecture source, and quality-baseline documentation.
- Explicitly treats photorealistic human portraits as the supported quality target; cartoon rendering remains experimental/unsupported.

# Quality baseline

The validated photorealistic pipeline is intentionally conservative:

1. Wav2Lip GAN checkpoint with `--nosmooth`.
2. Extract lossless PNG frames.
3. GFPGAN v1.4 with `upscale=1`, `arch="clean"`, `channel_multiplier=2`, no background upsampler.
4. `enhance(... has_aligned=False, only_center_face=True, paste_back=True, weight=0.65)`.
5. Encode H.264 at CRF 14 using the slow preset.

Do not replace the full-frame restoration with ROI-only restoration, Real-ESRGAN, or generic sharpening without a visual regression comparison. The current pipeline is intended for photorealistic human portraits; illustrated/cartoon faces are not a supported quality target.

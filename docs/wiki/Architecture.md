# Architecture

The pipeline is intentionally staged:

```text
Portrait + Script
      |
      v
   Piper TTS
      |
      v
 Wav2Lip GAN
      |
      v
 Lossless PNG
      |
      v
 GFPGAN v1.4
      |
      v
 FFmpeg CRF 14
      |
      v
 Final MP4
```

See the repository `docs/architecture/` directory for editable D2 sources.

# Installation

## macOS

```bash
brew install git ffmpeg python@3.10 d2 groff
git clone git@github.com:iamrichmack111/richchar-cli.git
cd richchar-cli
chmod +x richchar scripts/doctor.sh
./richchar --doctor
```

## Ubuntu

```bash
sudo apt update
sudo apt install -y git ffmpeg python3 python3-venv python3-pip unzip groff
git clone git@github.com:iamrichmack111/richchar-cli.git
cd richchar-cli
chmod +x richchar scripts/doctor.sh
./richchar --doctor
```

Piper, Wav2Lip, GFPGAN, and their model files are installed separately.

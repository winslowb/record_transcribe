# Recorder and Transcriber

This project allows you to record audio and transcribe it using `ffmpeg` and [whisper](https://github.com/openai/whisper.git) on an Ubuntu distrobution. It captures any audio played through your soundcard and converts it to text.

The intent is to create or add to a workflow that allows you to capture audio and convert to text/notes. For example, I might use [fabric](https://github.com/danielmiessler/fabric) to analyse and structure the content.  

## Prerequisites

- Ubuntu (tested on Ubuntu 20.04)
- `ffmpeg`
- `pulseaudio-utils`
- `python3`
- `pip`
- `whisper` (OpenAI's Whisper)

## Installation

### Step 1: Install Required Packages

Update your package list and install `ffmpeg` and `pulseaudio-utils`:

```bash
sudo apt update
sudo apt install ffmpeg pulseaudio-utils
```

### Step 2: Install Python and Whisper

Install `pip` and Whisper:

```bash
sudo apt install python3-pip
pip3 install git+https://github.com/openai/whisper.git
```

## Setup

### Step 1: Identify Audio Source

List the available audio sources to identify the correct one:

```bash
pactl list short sources
```

Look for the entry corresponding to the monitor of your output device (e.g., `alsa_output.pci-0000_00_1b.0.analog-stereo.monitor`).

Replace `YOUR_AUDIO_SOURCE` with the actual audio source you identified earlier.


## Usage

1. **Start **: Begin audio source (zoom meeting, podcast, etc).
2. **Run the Script**: Execute the script to start recording and transcribing:

```bash
./record_transcribe.sh
```

The script will record the audio for 1 hour and then transcribe it to text. Otherwise, ^ c will break the recording and /whisper/ will start transcribing and the script will save to a txt file in $HOME/recording 

## Notes

- Ensure that the audio source is playing out of correct output device.
- Adjust the recording duration by changing the value of the `-t` parameter in the `ffmpeg` command in the bash script.
- Transcribing audio on the CPU can be slow. Ensure your system can handle the load.

## License

This project is licensed under the MIT License.


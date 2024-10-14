#!/bin/bash
# You need to make sure the following is installed
# sudo apt update
# sudo apt install python3-pip
# pip3 install git+https://github.com/openai/whisper.git
# sudo apt install ffmpeg

# Define the output directory and file name
OUTPUT_DIR="$HOME/recordings"
TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
OUTPUT_FILE="$OUTPUT_DIR/recording_$TIMESTAMP.mp3"
TRANSCRIPTION_FILE="$OUTPUT_DIR/transcription_$TIMESTAMP.txt"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Define the audio source (replace with your actual source)
AUDIO_SOURCE="bluez_output.A4_05_6E_8E_F7_59.1.monitor"
# Start recording
echo "Recording ..."
ffmpeg -f pulse -i "$AUDIO_SOURCE" -t 3600 -acodec mp3 "$OUTPUT_FILE"

# Transcribe the audio
echo "Transcribing the audio..."
whisper "$OUTPUT_FILE" --output_dir "$OUTPUT_DIR" --output_format txt

# Move the transcription to a separate file
mv "$OUTPUT_DIR/recording_$TIMESTAMP.txt" "$TRANSCRIPTION_FILE"

echo "Recording saved to $OUTPUT_FILE"
echo "Transcription saved to $TRANSCRIPTION_FILE"


from vosk import Model, KaldiRecognizer, SetLogLevel
import argparse
import os
import subprocess
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor

SetLogLevel(-1)
SAMPLE_RATE = 16000
THREAD=4
video_appendix = [".mp4", ".mkv", ".flv", ".avi", ".rmvb", ".wmv", ".mov", ".mpg", ".mpeg", ".vob", ".m4v"]
audio_appendix=[".mp3", ".wav", ".flac", ".aac", ".m4a", ".ogg", ".opus"]
lang_to_process=['cn','None']
def process_text(text):
    text=text.replace(" ", "").replace("-->",' --> ')
    return text
def process_file(input_file, model_path, language):
    if os.path.splitext(input_file)[1] not in video_appendix+audio_appendix:
        print("❌ ", input_file)
        return
    if os.path.exists(os.path.splitext(input_file)[0] + ".srt"):
        print("⏩ ", input_file)
        return
    print("📽️ ", input_file)
    result = []
    with subprocess.Popen(["ffmpeg", "-loglevel", "quiet", "-i", input_file,
                         "-ar", str(SAMPLE_RATE), "-ac", "1", "-f", "s16le", "-"],
                         stdout=subprocess.PIPE).stdout as stream:
        # print(rec.SrtResult(stream))
        rec = KaldiRecognizer(Model(model_path) if language == "None" else Model(lang=language), SAMPLE_RATE)
        rec.SetWords(True)
        if language in lang_to_process:
            result.append(process_text(rec.SrtResult(stream).strip())) 
        else:
            result.append(rec.SrtResult(stream).strip())

    output_path = os.path.splitext(input_file)[0] + ".srt"
    with open(output_path, 'w') as output:
        output.write("\n".join(result))
    print("✅", input_file)

def main(input_path, path, language="None"):
    input_path_str = str(input_path)
    if not os.path.isdir(input_path):
        input_path = [input_path]
    else:
        input_path = [os.path.join(input_path_str, f) for f in os.listdir(input_path) if os.path.isfile(os.path.join(input_path_str, f))]

    model_path = os.path.abspath(path)
    with ThreadPoolExecutor(max_workers=THREAD) as executor:
        list(tqdm(executor.map(lambda file: process_file(file, model_path, language), input_path), total=len(input_path)))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("-i", "--input", type=str, required=True, help="📂input path")
    parser.add_argument("-p", "--path", type=str, required=False, default="model", help="📳model path")
    parser.add_argument("-l", "--language", type=str, required=False, default="None", help="🏁language like en-us, cn etc.")
    parser.add_argument("-t", "--threads", type=int, required=False, default=4, help="🧑‍💻threads count")
    args = parser.parse_args()
    THREAD=args.threads
    main(args.input, args.path, args.language)

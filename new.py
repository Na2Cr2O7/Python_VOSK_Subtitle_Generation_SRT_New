from vosk import Model, KaldiRecognizer, SetLogLevel
import argparse
import os
import subprocess
from tqdm import tqdm


SetLogLevel(0)
SAMPLE_RATE = 16000
video_appendix=[".mp4",".mkv",".flv",".avi",".rmvb",".wmv",".mov",".mpg",".mpeg",".vob",".m4v"]

def main(input_path, path,language="None"):
    input_path_str=str(input_path)
    if not os.path.isdir(input_path):
        input_path=[input_path]
    else:
        input_path=os.listdir(input_path)
    model_path = os.path.abspath(path)
    if language== "None":
        model = Model(model_path)
    else:
        model = Model(lang=language)
    rec = KaldiRecognizer(model, SAMPLE_RATE)
    rec.SetWords(True)
    for input_file in tqdm(input_path):
        if os.path.splitext(input_file)[1] not in video_appendix:
            print("❌ ",input_file)
            continue
        print("📽️ "+input_file)
        result = []
        with subprocess.Popen(["ffmpeg", "-loglevel", "quiet", "-i", os.path.join(input_path_str,input_file),
                            "-ar", str(SAMPLE_RATE) , "-ac", "1", "-f", "s16le", "-"],
                            stdout=subprocess.PIPE).stdout as stream:
        # print(rec.SrtResult(stream))
            result.append(rec.SrtResult(stream).strip())
        output = open(os.path.join(input_path_str,os.path.splitext(input_file)[0]+".srt"),'w')
        output.write("\n".join(result))
        output.close()
        print("✅",input_file)
    print("✅")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("-i", "--input", type=str, required=True, help="📂input path")
    parser.add_argument("-p", "--path", type=str, required=False, default="model", help="📳model path")
    parser.add_argument("-l", "--language", type=str, required=False, default="None", help="🏁language like en-us, cn etc.")
    args = parser.parse_args()
    main(args.input, args.path, args.language)

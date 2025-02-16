# **一键批量**生成**多个视频**的**中英文字幕**

## **用处**
基于python的vosk语言模型，进行**一键批量**的生成**多个视频**的**字幕**，中英文都可以。中文识别率不高。  
**做来倍速播放视频用的** 
> >有帮助的话可以给个**star**
* * *
## **使用说明**
---------

### **来源**  
> vosk项目地址  
> https://alphacephei.com/vosk/models    

> **参考**  **感谢**  
> 有什么软件可以自动生成视频字幕？ - CycleUser的回答 - 知乎
> https://www.zhihu.com/question/397207300/answer/2806069443
> 
下面部分摘抄**CycleUser**的文章  
首先安装好**python**，不做详细说了。   

然后从终端上安装两个需要的包  

对于 macOS 用户来说，使用 brew 和 pip3:
> brew install ffmpeg  
> pip3 install vosk   

对于 Windows 用户来说，使用 winget 和 pip3:
> winget install ffmpeg  
> pip3 install vosk
  
使用方法
```
usage: new.py [-h] -i INPUT [-p PATH] [-l LANGUAGE] [-t THREADS]

options:
  -h, --help            show this help message and exit
  -i, --input INPUT     📂input path
  -p, --path PATH       📳model path
  -l, --language LANGUAGE
                        🏁language like en-us, cn etc.
  -t, --threads THREADS
                        🧑‍💻threads count

```
			
# **One-click Batch Generation** of **Multiple Videos** with **Chinese and English Subtitles**

## **Purpose**
Leveraging the python-based Vosk language model, this project enables the **one-click batch** generation of **subtitles** for **multiple videos**, supporting both Chinese and English. Note that the recognition accuracy for Chinese is not very high. This tool is particularly useful for creating subtitles to enable faster video playback.
> > If helpful, consider giving it a **star**.
* * *
## **Usage Instructions**
---------

### **Sources**  
> Vosk project address  
> https://alphacephei.com/vosk/models    

> **References & Acknowledgments**  
> What software can automatically generate video subtitles? - CycleUser's answer on Zhihu
> https://www.zhihu.com/question/397207300/answer/2806069443

Below is an excerpt from **CycleUser**'s article:

Firstly, ensure **python** is installed (details not covered here).

Then, install the two required packages via terminal:

For macOS users, use brew and pip3:
> brew install ffmpeg  
> pip3 install vosk   

For Windows users, use winget and pip3:
> winget install ffmpeg  
> pip3 install vosk  

**Usage**
```
usage: new.py [-h] -i INPUT [-p PATH] [-l LANGUAGE] [-t THREADS]

options:
  -h, --help            show this help message and exit
  -i, --input INPUT     📂input path
  -p, --path PATH       📳model path
  -l, --language LANGUAGE
                        🏁language like en-us, cn etc.
  -t, --threads THREADS
                        🧑‍💻threads count
```		







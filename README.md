# **一键批量**生成**多个视频**的**中英文字幕**

## **用处**
基于python的vosk语言模型，进行**一键批量**的生成**多个视频**的**字幕**，中英文都可以。中文识别率不高。  
**做来倍速播放视频用的** 
> >GitHub项目链接：
> >[GitHub链接](https://github.com/RyananChen/Python_VOSK_Subtitle_Generation_SRT)  
> >有帮助的话可以给个**star**
> >所有文件打包**下载链接**  
> > 国内:  [123网盘直链下载](https://www.123pan.com/s/mVTcVv-9oGJ.html)   提取码:RYAN  
> > GitHub: [Releases链接](https://github.com/RyananChen/Python_VOSK_Subtitle_Generation_SRT/releases/tag/V1.0.0)  
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
最新的3.11.3版本python [官网下载链接](https://www.python.org/ftp/python/3.11.3/python-3.11.3-amd64.exe  )  
 
然后从终端上安装两个需要的包  

对于 macOS 用户来说，使用 brew 和 pip3:
> brew install ffmpeg  
> pip3 install vosk   

对于 Windows 用户来说，使用 winget 和 pip3:
> winget install ffmpeg  
> pip3 install vosk
  
使用方法
'''
usage: new.py [-h] -i INPUT [-p PATH] [-l LANGUAGE]

options:
  -h, --help            show this help message and exit
  -i, --input INPUT     📂input path
  -p, --path PATH       📳model path
  -l, --language LANGUAGE
                        🏁language like en-us, cn etc.
'''
			
			







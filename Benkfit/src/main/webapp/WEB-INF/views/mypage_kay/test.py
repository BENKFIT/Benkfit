#-*- coding: utf-8 -*-
import os
import cv2 
import sys
from PIL import Image
from pytesseract import * #글씨인식 lib  => 시스템 환경변수에 path추가 
from matplotlib import pyplot as plt

os.chdir("C:/Users/82109/Desktop/image/")

def OCR(imgfile, lang='kor+eng'):
    img = Image.open(imgfile)
    text = image_to_string(img, lang=lang)
    print(text)
    
    # 현재 기준 폴더 변경
    os.chdir("C:/Users/82109/Desktop/image/")
 
    file = open(imgfile[:-4] + '.txt', 'w')
    file.write(text)
    file.close()
OCR('DSF.jpg', 'kor+eng')

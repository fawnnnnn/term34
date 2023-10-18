import os
import time
import subprocess

from ultralytics import YOLO
import cv2

# Load a model
# model = YOLO("yolov8n.yaml")  # build a new model from scratch
model = YOLO('E:/STUDY/XXQ/ultralytics/best.pt')  # load a pretrained model (recommended for training)

# Use the model
img_path = "E:/STUDY/XXQ/ultralytics/image"
results = model.predict(img_path, save=True,save_txt=True,conf=0.4)

# Check if the predict folder has been generated
predict_folder = r"C:/Users/19394/runs/detect/predict"
while not os.path.exists(predict_folder):
    time.sleep(10)

# Call the Java program
java_program_path = r"C:/Users/19394/runs/detect/ImageComparator.java"
os.system(f"java {java_program_path}")

# Call the Python script
pic_collect_script_path = r"C:/Users/19394/runs/detect/PicCollect.py"
subprocess.call(f"python {pic_collect_script_path}", shell=True)

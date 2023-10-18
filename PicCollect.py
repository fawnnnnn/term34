import os
import shutil

# 原始文件夹路径
predict_folder = r"C:/Users/19394/runs/detect/predict"
labels_folder = r"C:/Users/19394/runs/detect/predict/labels"

# 目标文件夹路径
output_folder = r"E:/Pic"

# 遍历预测文件夹中的jpg文件
for filename in os.listdir(predict_folder):
    if filename.endswith(".jpg"):
        # 构建对应的标签文件路径
        label_file = os.path.join(labels_folder, filename.replace(".jpg", ".txt"))

        # 如果标签文件存在，则复制此jpg文件到目标文件夹中
        if os.path.exists(label_file):
            source_file = os.path.join(predict_folder, filename)
            target_file = os.path.join(output_folder, filename)
            shutil.copy(source_file, target_file)

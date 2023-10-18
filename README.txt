The following is a summary of the working principles and usage instructions for the three code snippets:

For demo.py:

Import necessary libraries including os, time, subprocess, and cv2.
Import the YOLO model from the "ultralytics" package.
Create a YOLO model object either by building a new model from scratch or loading a pretrained model.
Use the model to predict on a specified image path with certain parameters and save the results.
Check if the prediction folder has been generated and wait for it if not.
Call the Java program "ImageComparator.java".
Call the Python script "PicCollect.py".


For ImageComparator.java:

Import necessary libraries including javax.swing, java.awt, java.io.BufferedReader, and java.io.File.
Create a class named "ImageComparator" that extends JFrame.
Define folder paths and file arrays.
Initialize GUI components including image labels, prediction labels, and text areas.
Load and display image files.
Implement event handling for previous and next buttons.
Create a SwingUtilities thread to run the program.


For PicCollect:

Import necessary libraries including os and shutil.
Define the paths for the source and target folders.
Iterate through the jpg files in the prediction folder.
For each jpg file, construct the corresponding label file path.
If the label file exists, copy the jpg file to the target folder.
When using these codes, you can configure and call them based on specific requirements:

  For demo.py , you can choose to use a pretrained model or build a new one from scratch, and specify the image path for prediction. Additionally, you can set prediction parameters such as confidence threshold.
  For ImageComparator.java , simply run the program and it will display a GUI interface where you can navigate through the original images, predicted images, and label texts using the provided buttons.
  For PicCollect , you need to set the paths for the source folder, label folder, and target folder. Then, run the code to copy the predicted images with corresponding labels to the target folder.
  Note: When running the codes, ensure that the file and folder paths are correct, and install any required libraries and dependencies.
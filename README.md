# LOVE-TY

## Design ideas

![image](https://github.com/lymlxf/LOVE-TY/assets/148335347/2bee0018-641a-43fe-a9ab-067deaf2c969)

We design and build a prototype of a robot control system that uses an automatic robot to explore a walled maze with a hidden treasure inside. The robot finds the route through the maze and locate the hidden treasure. We use the camera to take pictures of the treasure and identify the type of treasure using object detection algorithm.
The robot also reports the map of the maze, the time of exploration and the pictures taken. We have make a web application that provides current and historical exploration records. And we have a database be designed to manage all information for the whole system.


This design takes the arduino mega 2560 development board as the core, controls the motor drive module through the L298N two-way DC motor, and completes the forward and turning actions of the trolley through five-way addressing and ultrasonic sensors. Through the ultrasonic ranging module at the front of the car and the motor module of the trolley, the obstacle avoidance function of the trolley is realized; Through five-way addressing, the tracking function of the trolley is realized.

The design of this paper reserves an expansion interface, which can expand the Bluetooth control module and servo module on the basis of the obstacle avoidance module, so that the car has stronger intelligence. The overall block diagram of obstacle avoidance is shown in the following figure:

![image](https://github.com/lymlxf/LOVE-TY/assets/148335347/d174443b-e52a-4ee8-8447-97a7195dc582)

Travel direction and turning: we use three ultrasonic sensors to control the direction of travel of the trolley, the current sensor perception distance is less than a certain value when the turn is triggered, the sensors on both sides measure the distance separately, when the left distance is greater than the right, the trolley turns left; When the right distance is greater than the left, the trolley turns right.
Identify colors: Use color sensors to identify different colors to find treasures.
Five-way tracking: Based on the infrared reflection sensor, the infrared emitting diode of the sensor continuously emits infrared rays, and when the emitted infrared rays are reflected by the object, they are collected by the infrared receiver and output analog values. The output analog value is related to the distance of the object and the color of the object. By calculating the analog value of the five outputs, the position of the trace line is judged to realize that the smart car can drive along the black line.
Bluetooth: Remote control of the trolley via Bluetooth.
WIFI: wifi controls camera photography and video, takes three photos per second and uploads data to IoT for the next step.


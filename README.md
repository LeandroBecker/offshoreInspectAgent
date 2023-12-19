# offshoreInspectAgent

Running a test using ARIAC-2023 requires 3 terminals:
TERMINAL-1:
$ source galactic
$ source ariac
$ ros2 launch ariac_gazebo ariac.launch.py trial_name:=human_kitting

TERMINAL-2:
$ source galactic
$ source ariac
$ ros2 launch ariac_moveit_config ariac_robots_moveit.launch.py

TERMINAL-3:
$ ./gradlew run  #run the modified-agent

Running a test using ROS2 topics:
$ ros2 topic pub /ariac/position_reached std_msgs/msg/Bool '{data: true}' --once 

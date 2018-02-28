echo "Starting Kingfisher essential services -Yuxin"
roscore &
sleep 8
echo "In progress, please wait...."
sleep 4
./serialNode.sh &
sleep 8
echo "Serial connection established"
sleep 4
./monitor.sh &
./GPS.sh &
./compass.sh &

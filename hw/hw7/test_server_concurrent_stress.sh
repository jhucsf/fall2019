#! /bin/bash

if [ "$#" -ne 1 ]; then
	echo "usage: ./test_server_concurrent_stress.sh <port>"
	exit 1
fi

port="$1"

# Start server process
./calcServer $port &
CALC_PID=$!

# Remove previous final_count.txt file
rm -f final_count.txt

# Give the server a moment or two to start up...
sleep 2

# Create and initialize the shared variable
(echo "k = 0"; echo "quit") | nc localhost $port
sleep 1

# Start clients
NUM_INCR=100000
( ( (perl -e 'for $v (1..'$NUM_INCR') { print "k = k + 1\n" }'; echo "quit") | nc localhost $port) > /dev/null )&
CLIENT_PID1=$!
( ( (perl -e 'for $v (1..'$NUM_INCR') { print "k = k + 1\n" }'; echo "quit") | nc localhost $port) > /dev/null )&
CLIENT_PID2=$!
# Client 3 creates new variables in a tight loop
( ( (perl -e 'sub r { chr(97+int(rand(26))) }; for $v (1..'$NUM_INCR') { print r().r().r()," = ",int(rand(1000)),"\n" }'; echo "quit") | nc localhost $port) > /dev/null )&
CLIENT_PID3=$!

# Wait for clients to finish
wait $CLIENT_PID1
echo "Client 1 finished"
wait $CLIENT_PID2
echo "Client 2 finished"
wait $CLIENT_PID3
echo "Client 3 finished"

# Get final count, save to final_count.txt
( (echo "k"; echo "quit") | nc localhost $port) > final_count.txt

# Shut down server
sleep 1
kill -9 $CALC_PID

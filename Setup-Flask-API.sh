#!/bin/bash

# Make required directories in the docker container
mkdir tempdir

# Copy data from our host system to the docker container
cp ./Assessment2B/* tempdir/.

# Create a dockerfile to automate the container creation process
echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY  sample-app.sh /home/myapp/" >> tempdir/Dockerfile
echo "COPY  assessment_code.py /home/myapp/" >> tempdir/Dockerfile
echo "COPY  network_equipment.json /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python /home/myapp/assessment_code.py" >> tempdir/Dockerfile

# Build and run the container using the dockerfile above.
cd tempdir
# Create an image from the dockerfile
docker build -t apiserver .
# Run the image
docker run -t -d -p 5050:5050 --name apirunning apiserver
# Check that the container got created
docker ps -a


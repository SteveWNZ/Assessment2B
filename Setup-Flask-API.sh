#!/bin/bash

# Make required directories in the docker container
mkdir tempdir

# Copy data from our host system to the docker container
cp assessment_code.py tempdir/.
cp network_equipment.json tempdir/.
cp Setup-Flask-API.sh tempdir/.
cp id1-new tempdir/.
cp id1-new.py tempdir/.
cp id1-old tempdir/.
cp id1-old.py tempdir/.

# Create a dockerfile to automate the container creation process
echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY  Setup-Flask-API.sh /home/myapp/" >> tempdir/Dockerfile
echo "COPY  assessment_code.py /home/myapp/" >> tempdir/Dockerfile
echo "COPY  network_equipment.json /home/myapp/" >> tempdir/Dockerfile
echo "COPY  id1-new /home/myapp/" >> tempdir/Dockerfile
echo "COPY  id1-new.py /home/myapp/" >> tempdir/Dockerfile
echo "COPY  id1-old /home/myapp/" >> tempdir/Dockerfile
echo "COPY  id1-old.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "EXPOSE 5051" >> tempdir/Dockerfile
echo "CMD python /home/myapp/assessment_code.py" >> tempdir/Dockerfile

# Build and run the container using the dockerfile above.
cd tempdir
# Create an image from the dockerfile
docker build -t apiserver .
# Run the image
docker run -t -d -p 5050:5050 -p 5051:5051 --name apirunning apiserver &
# Check that the container got created
docker ps -a


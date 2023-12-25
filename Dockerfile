FROM python:3.10
WORKDIR /app
RUN apt-get update -y
#RUN apt-get install -y cmake python3-pip python3-dev build-essential hdf5-tools libgl1 libgtk2.0-dev
RUN apt-get install -y cmake python3-pip python3-dev hdf5-tools libgl1 libgtk2.0-dev
#RUN apt-get install -y Cmake
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 80 
CMD ["python", "./people_counter.py", "--prototxt", "detector/MobileNetSSD_deploy.prototxt", "--model", "detector/MobileNetSSD_deploy.caffemodel", "--input", "utils/data/tests/test_1.mp4"]
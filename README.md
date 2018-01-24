# coursera-aml-docker
Docker container with Jupyter Environment for Coursera "Advanced Machine Learning" specialization: https://www.coursera.org/specializations/aml

## Install Stable Docker Community Edition
For Mac: https://docs.docker.com/docker-for-mac/install/

For Windows (64bit Windows 10 Pro, Enterprise and Education):
https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install

For Windows (older versions):
https://docs.docker.com/toolbox/toolbox_install_windows/

For Linux: https://docs.docker.com/engine/installation/

## Running container for the first time
First run `docker pull zimovnov/coursera-aml-docker` to pull the latest version of image.
Run using `docker run -it -p 127.0.0.1:8080:8080 --name coursera-aml-1 zimovnov/coursera-aml-docker`.
This command downloads the prepared image from a public hub and starts a Jupyter for you. 
Let this command continue running in the terminal while you work with Jupyter.

You can now navigate to <http://localhost:8080> in your browser to see Jupyter.

## Stopping and starting the container
This "stop and start" scenario is useful when you want to take a break and turn off your host machine.

### Stopping the container
Save your work inside the container, then run `docker stop coursera-aml-1` in different terminal window 
to stop a running container. You will be able to start it later.

### Starting container after stopping
Run `docker start -a coursera-aml-1` to run previously stopped container and attach to its stdout.
You can continue to work where you left off.

## Container checkpoints
You might want to make a checkpoint of your work so that you can return to it later.
Think of it as a backup or commit in version control system.

### Saving container state
You will first have to stop the container following instructions above.
Now you need to save the container state so that you can return to it later:
`docker commit coursera-aml-1 coursera-aml-snap-1`. 
You can make sure that it's saved by running `docker images`.

### Creating new container from previous checkpoint
If you want to continue working from a particular checkpoint, you should run a new container from your
saved image by executing `docker run -it -p 127.0.0.1:8080:8080 --name coursera-aml-2 coursera-aml-snap-1`.
Notice that we incremented index in the container name, because we created a new container.

## Using GPU in your container (Linux hosts only)
You can use NVIDIA GPU in your container on Linux host machine.
- Setup docker following instructions from NVIDIA: 
https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0)#prerequisites
- In your container replace CPU TensorFlow version with the one that supports GPU:
```
pip3 uninstall tensorflow
pip3 install tensorflow-gpu==1.2.1
```
- You will also have to install NVIDIA GPU driver, CUDA toolkit and CuDNN 
(requires registration with NVIDIA) 
in your container in order for TensorFlow to work with your GPU: 
https://www.tensorflow.org/versions/r1.2/install/install_linux#nvidia_requirements_to_run_tensorflow_with_gpu_support
It can be hard to follow, so you might choose to stick to a CPU version, 
which is also fine for the purpose of this course.
- TensorFlow provides Docker files with TensorFlow on GPU, but they don't have 
all the additional dependencies we need, this is for advanced users: 
https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker 
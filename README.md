# coursera-aml-docker
Docker container with Jupyter Environment for Coursera "Advanced Machine Learning" course.

## Install Stable Docker Community Edition
For Mac: https://docs.docker.com/docker-for-mac/install/

For Windows: https://docs.docker.com/docker-for-windows/install/

For Linux: https://docs.docker.com/engine/installation/

## Running container for the first time
Run using `docker run -it -p 8080:8080 --name coursera-aml-1 zimovnov/coursera-aml-docker`.
This command downloads the prepared image from a public hub and starts a Jupyter for you. 
Let this command continue running in the terminal while you work with Jupyter.

You can now navigate to <http://localhost:8080> in your browser to see Jupyter.

## Saving container state
If you need to take a break you can do so by pressing `Ctrl+C` in terminal window 
running Jupyter in docker container. 
You may need to press it several times to finally exit Jupyter.

Then you execute `exit` in that window to stop a docker container.

Now you need to save the container state so that you can return to it later:
`docker commit coursera-aml-1 coursera-aml-snap-1`. 
You can make sure that it's saved by running `docker images`.

## Starting container from previous state
If you want to continue working where you left off, you should run the container from your
saved image by executing `docker run -it -p 8080:8080 --name coursera-aml-2 -d coursera-aml-snap-1`.
Notice that we incremented index in the container name.
You can then attach to that container using `docker attach coursera-aml-2`.
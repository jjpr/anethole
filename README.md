## Equation-to-Object Instructions

A description of a process for turning mathematical expressions into physical objects.  

From this ![the equation][equation] to this ![the figure][figure] to this ![the printed object][object]

### WORK IN PROGRESS
#### These instructions are not complete

#### Docker Images:  
- **jupyter-simple**:  A simple setup with Jupyter notebook and scientific Python libraries. 
- **mayavi-jupyter**:  Adds Enthought's Mayavi to jupyter-simple, with an SSH server so that the user can use X11 to view the Mayavi GUI.  
- **blender-mayavi-jupyter**:  Adds Blender to mayavi-jupyter for mesh modification.  
- **equation-to-object**:  Adds tutorial notebook and related support files to blender-mayavi-jupyter.  

#### Prerequisites
- A Macintosh, relatively recent (this has been tested on a MacBook Pro (Retina, 15-inch, Early 2013) running Yosemite)
- Docker Toolbox (tested on 1.10.0)
- XQuartz
- Meshlab
- start_notebook.sh from https://github.com/jjpr/equation_to_object

#### Instructions Summary
- Install the prerequisites
- Download and run the shell script start_notebook.sh
  - The script will start a download of a Docker image;  this download could take a long time, up to an hour on low bandwidth
  - once the download is complete, the script should start a Docker container based on the image, SSH into it, launch a Jupyter iPython Notebook server, and open your browser to the notebook server's home page
  - This is all a horrible kludge, expect to do some troubleshooting
- Once your browser open to the home page of the Jupyter iPython notebook server, navigate to the Equation To Object Instructions notebook in the notebooks directory, and open it

#### Shutting Down:  
To stop the notebook server, close and halt all open notebooks (File > Close and Halt), then, in the terminal window where jupyter is running, type Control-C.  When it asks if you want to stop the server, type y and hit enter.  To stop the container, type "docker ps" to find the name of the running container, then type "docker stop <container name>".  To stop the Docker virtual machine, type "docker-machine stop default".
  

[equation]: docker/equation-to-object/images/ruffle_equation.png
[figure]: docker/equation-to-object/images/wrapped_ruffle.png
[object]: docker/equation-to-object/images/printed.png
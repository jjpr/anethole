## Equation-to-Object Instructions

### WORK IN PROGRESS

A description of a process for turning mathematical expressions into physical objects.  

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

#### Shutting Down:  
To stop the notebook server, close and halt all open notebooks (File > Close and Halt), then, in the terminal window where jupyter is running, type Control-C.  When it asks if you want to stop the server, type y and hit enter.  To stop the container, type "docker ps" to find the name of the running container, then type "docker stop <container name>".  To stop the Docker virtual machine, type "docker-machine stop default".  
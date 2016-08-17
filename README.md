## Anethole
### A cobbled-together toolkit for turning mathematical expressions into physical objects using Python and 3D printing.  

From this ![the equation][equation] to this ![the figure][figure] to this ![the printed object][object]

This project aims to provide a toolkit and a tutorial which will enable any moderately technical user to turn a mathematical equation into a 3D printed physical object.  You don't even need to own a 3D printer.  

#### Want to skip to the end?  The example from the tutorial is available at [The Intricate Geometries shop at Shapeways][8]

#### WORK IN PROGRESS:  These instructions are not yet complete

#### Docker Images:  
- **jupyter-simple**:  A simple setup with Jupyter notebook and scientific Python libraries. 
- **mayavi-jupyter**:  Adds Enthought's Mayavi to jupyter-simple, with an SSH server so that the user can use X11 to view the Mayavi GUI.  
- **blender-mayavi-jupyter**:  Adds Blender to mayavi-jupyter for mesh modification.  
- **anethole**:  Adds tutorial notebook and related support files to blender-mayavi-jupyter.  

#### WARNING:  Do not run these images on a server, they are not secure.  Run them only on a VM (as with Docker Toolbox on Windows or OS X) which is not accessible from a wider network.

#### Prerequisites
- A Macintosh, relatively recent (this has been tested on a MacBook Pro (Retina, 15-inch, Early 2013) running Yosemite)
- [Docker for Mac][3] (tested on 1.12.0-a)
- [XQuartz][4]
- [Meshlab][5]
- An account at [Shapeways][2]
- The shell script [start_notebook.sh][6] from https://github.com/jjpr/anethole (obtain the shell script either by cloning the repository from GitHub, or by downloading the script via the "Raw" link on its listing on GitHub)

#### Setup Instructions
- Install the applications from the prerequisites list.  
- Download and run the shell script [start_notebook.sh][6].  
  - The script will start a download of a Docker image;  this download is very large (~3.7GB) and could take a long time, up to an hour on low bandwidth.  
  - once the download is complete, the script should automatically start a Docker container based on the image, SSH into it, launch a Jupyter iPython Notebook server, and open your browser to the notebook server's home page.  
  - This is all a horrible kludge, expect to do some troubleshooting.  
- Once your browser opens to the home page of the Jupyter iPython notebook server, navigate to the Equation To Object Instructions notebook in the examples directory, and open it.  Follow the instructions in the notebook.  

To preview the Equation To Object Instructions notebook on GitHub in a non-executable form, including more detailed instructions, go to [Equation_To_Object_Instructions][7].

#### Shutting Down:  
To stop the notebook server, close and halt all open notebooks (File > Close and Halt), then, in the terminal window where jupyter is running, type Control-C.  When it asks if you want to stop the server, type y and hit enter.  To stop the container, type "docker stop anethole".  

To start up again later, just run start_notebook.sh again.  There will be messages in Terminal about things already existing, but you can ignore them.  
  

[equation]: docker/anethole/images/ruffle_equation.png
[figure]: docker/anethole/images/wrapped_ruffle.png
[object]: docker/anethole/images/printed.png

[1]: http://www.python.org/
[2]: http://www.shapeways.com/
[3]: https://www.docker.com/products/docker#/mac
[4]: http://www.xquartz.org/
[5]: http://meshlab.sourceforge.net/
[6]: https://github.com/jjpr/anethole/raw/master/start_notebook.sh
[7]: https://github.com/jjpr/anethole/blob/master/docker/anethole/Equation_To_Object_Instructions.ipynb
[8]: https://www.shapeways.com/shops/intricate_geometries
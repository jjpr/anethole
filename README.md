## Anethole
### A cobbled-together toolkit for turning mathematical expressions into physical objects using Python and 3D printing.  

#### From this ![the equation][equation] 
#### to this ![the figure][figure] 
#### to this ![the printed object][object]

This project aims to provide a toolkit and a tutorial which will enable any moderately technical user to turn a mathematical equation into a 3D printed physical object.  You don't even need to own a 3D printer.  

#### Want to skip to the end?  The example from the tutorial is available at [The Intricate Geometries shop at Shapeways][8]

#### Docker Image:  
- **jjpr/anethole**:  Environment with JupyterLab, Mayavi and all their dependencies.  Contains tutorial notebook and related support files.  

#### Prerequisites
- A Macintosh with macOS no more than about 6 years old
- [Docker Desktop][3]
- [Meshlab][5]
- An account at [Shapeways][2]
- The shell script [start_anethole.command][6] from https://github.com/jjpr/anethole (obtain the shell script either by cloning the repository from GitHub, or by downloading the script via the "Raw" link on its listing on GitHub)

#### Setup Instructions
- Install the applications from the prerequisites list.  
- Download and run the shell script [start_anethole.command][6].  
  - The script will start a download of a Docker image;  this download could take time.  
  - Once the download is complete, the script should automatically start a Docker container based on the image, launch JupyterLab, and open your browser to the JupyterLab interface.  
- Navigate to the Equation To Object Instructions notebook in the `examples` directory, and open it.  Follow the instructions in the notebook.  

To preview the Equation To Object Instructions notebook on GitHub in a non-executable form, including more detailed instructions, go to [Equation_To_Object_Instructions][7].

#### Shutting Down:  
To stop JupyterLab, from the File menu select Shut Down.  In the warning dialog, click Shut Down.  

To start up again later, just double-click start_anethole.command.  

[equation]: images/ruffle_equation.png
[figure]: images/wrapped_ruffle.png
[object]: images/printed.png

[1]: http://www.python.org/
[2]: http://www.shapeways.com/
[3]: https://www.docker.com/products/docker-desktop
[5]: https://www.meshlab.net/
[6]: https://github.com/jjpr/anethole/raw/master/start_anethole.command
[7]: https://github.com/jjpr/anethole/blob/master/Equation_To_Object_Instructions.ipynb
[8]: https://www.shapeways.com/shops/intricate_geometries


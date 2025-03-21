# Robot Framework Assignment

## Prerequisites

To complete this assignment, students must install the following libraries and packages. Additionally, a basic understanding of testing concepts is recommended.

### 1. Install Python
Download and install Python from the official site: [Python Downloads](https://www.python.org/downloads/). 
Ensure that you set the `PATH` correctly to use Python after installation.

### 2. Verify Pip Installation
PIP is installed along with Python. To verify the installation, run:
```sh
pip --version
```

### 3. Install Robot Framework
Use `pip`, the Python package manager, to install Robot Framework:
```sh
pip install robotframework
```
Verify the installation:
```sh
robot --version
```

### 4. Install wxPython for Ride IDE
Ride IDE requires wxPython. Install it as follows:
- **Windows**: Download and install from [wxPython SourceForge](https://sourceforge.net/projects/wxpython/files/wxPython/2.8.12.1/)
- **Linux**: Install wxPython using your OS's package manager.

### 5. Install Robot Framework Ride
To install Ride IDE, run:
```sh
pip install robotframework-ride
```
To open Ride IDE, execute:
```sh
ride.py
```

## Running the Test File
After installation, you can execute your test script `test.robot` using the following command:
```sh
robot test.robot
```
This will run the test and generate a report in the output directory.

---
Ensure all dependencies are installed correctly before running the test file.


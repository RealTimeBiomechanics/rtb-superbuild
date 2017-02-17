RealTimeBiomechanics & CEINMS Superbuild
---------------
This is a meta repository (so-called "superbuild") that uses [YCM](https://github.com/robotology/ycm) to compile RTB and CEINMS-related software.
A YCM Superbuild is a CMake project, the only goal of which is to download and build several other projects. You can read more about the superbuild concept in [YCM documentation](http://robotology.github.io/ycm/gh-pages/master/manual/ycm-superbuild.7.html).

Users can select which projects will be built through the following CMake options (see [Installation](#Installation) for detailed instructions):

* `RTB-SUPERBUILD_RTOSIM` (default: _ON_) to build the [Real Time Opensim](https://github.com/RealTimeBiomechanics/rtosim) repository and its dependencies:
    * Filter
    * Concurrency
    * RTOSIM
* `RTB-SUPERBUILD_CEINMS` (default: _ON_) to build the [CEINMS](https://github.com/CEINMS/CEINMS) repository and its dependencies
    * Concurrency
    * CEINMS
* `RTB-SUPERBUILD_CEINMS_RT_DEPS` (default: _OFF_) to build CEINMS and the additional libraries that are used for its realtime applications
    * CEINMS
    * mcbs
    * Filter

Installation
------------
We provide different instructions on how to install ceinms-superbuild, depending on your operating system:
* [**Windows**](#windows): use the superbuild with Microsoft Visual Studio
* [**Linux**](#linux): use the superbuild with make

## Windows

### System Dependencies
To install Git, you can use the installer available at http://git-scm.com/downloads
To install CMake you can use the official installer available at http://www.cmake.org/cmake/resources/software.html .
For other dependencies, see the documentation pages for each project.


### Superbuild
You can clone the superbuild repository as any other Git repository, and generate the Visual Studio solution
using the CMake gui:

* on the top panel, set the source code directory to where you cloned the Git repository (`<RTB-SUPERBUILD_SOURCE_DIR>`) and the build directory (`<RTB-SUPERBUILD_BUILD_DIR>`) to a directory of your choice; a common choice is `<RTB-SUPERBUILD_BUILD_DIR> = <RTB-SUPERBUILD_SOURCE_DIR>/build`
* hit `Configure` once
* set `YCM_GIT_BITBUCKET_USERNAME` to your BitBucket account username
* set `YCM_GIT_BITBUCKET_BASE_ADDRESS` to choose your preferred protocol among the available ones
* enable the options you are interested in among `RTB-SUPERBUILD_RTOSIM` `RTB-SUPERBUILD_CEINMS` `RTB-SUPERBUILD_CEINMS_RT_DEPS`
* **if (and only if) you are a developer for a project** enable the `YCM_EP_DEVEL_MODE_<project_name>` for that project
* hit `Configure` until all red lines disappear (and check the message windows for the list of projects that were found /will be built)
* hit `Generate`
Then, you can simpy open the generated solution with Visual Studio and build the target `all`.
Visual Studio will then download, build and install in a local directory all the CEINMS software and its dependencies.

### Configure your enviroment
Currently the YCM superbuild does not support building a global install target, so all binaries are installed in `<RTB-SUPERBUILD_BUILD_DIR>/install/bin` and all libraries in `<RTB-SUPERBUILD_BUILD_DIR>/install/lib`.

To use this binaries and libraries, you should append `<RTB-SUPERBUILD_BUILD_DIR>/install/bin` to your PATH environment variable.


## Linux
### System Dependencies
On Debian based systems (as Ubuntu) you can install git, CMake and other dependencies (see the documentation pages for each project to find what they are) using `apt-get`:

```
sudo apt-get install git cmake cmake-curses-gui
```


### Superbuild
Finally, after installing all the system dependencies, it is possible to install RTB and CEINMS software using the YCM superbuild.
Clone the rtb-superbuild repository to a directory of your choice (<RTB-SUPERBUILD_SOURCE_DIR>), then:

```bash
cd <RTB-SUPERBUILD_SOURCE_DIR>
mkdir build
cd build
ccmake ../
```

* set `YCM_GIT_BITBUCKET_USERNAME` to your BitBucket account username
* set `YCM_GIT_BITBUCKET_BASE_ADDRESS` to choose your preferred protocol among the available ones
* enable the options you are interested in among `RTB-SUPERBUILD_RTOSIM` `RTB-SUPERBUILD_CEINMS` `RTB-SUPERBUILD_CEINMS_RT_DEPS`
* **if (and only if) you are a developer for a project** enable the `YCM_EP_DEVEL_MODE_<project_name>` for that project
* hit 'c' until the generator command is available, then hit 'g'.
Then, to download and build all the projects:

```bash
make
```

The directory 'build' will be referred to as `<RTB-SUPERBUILD_BUILD_DIR>`.

### Configure your enviroment
Currently the YCM superbuild does not support building a global install target, so all binaries are installed in `<RTB-SUPERBUILD_BUILD_DIR>/install/bin` and all libraries in `<RTB-SUPERBUILD_BUILD_DIR>/install/lib`.

To use this binaries and libraries, you should update the `PATH` and `LD_CONFIG_PATH` environment variables.

An easy way is to add these lines to the `.bashrc` file in your home directory:
```
RTB-SUPERBUILD_ROOT=/directory/where/you/downloaded/rtb-superbuild
export PATH=$PATH:$RTB-SUPERBUILD_ROOT/build/install/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$RTB-SUPERBUILD_ROOT/build/install/lib
```
To use the updated `.bashrc` in your terminal you should run the following command:
```bash
user@host:~$ source ~/.bashrc
```
It may also be necessary to update the cache of the dynamic linker:
```bash
user@host:~$ sudo ldconfig
```
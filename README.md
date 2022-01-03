# Project Template
This is a template for starting a new MCUd project.

Here are the steps to get started with this:
  - Fork the project
  - Clone it
  - Get MCUd `git submodule update --init mcud`
  - Set your target board in `Makefile`
  - Generate a Dub project `make dub`
  - Open the Dub project using your favourite IDE.
  - Run `make download_buildcache` to download the build cache and speed up the first build (for archetypes that support build caching)

To build the project:
  - Make sure Docker is running in the background
  - Run `make`

Have fun!

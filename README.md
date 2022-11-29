Anaconda ska-gridder-nifty-cuda Build
===========================================================

The repository is for building different Anaconda packages from [ska-gridder-nifty-cuda](https://gitlab.com/ska-telescope/sdp/ska-gridder-nifty-cuda/-/tree/sim-874-python-wrapper) with different versions. For this the following setup is provided:

## Version Management
- In `build.yaml` update the `VERSION` parameter.
 
## Dev Management
- In `build.yaml` update the `LABEL` parameter to `dev` or `main`.

## Build
- The command to create the package is `conda build .`

## Upload
- Depending on your local anaconda setup, you might have to upload the package manually, which can look similar to the following command:
```
# To have conda build upload to anaconda.org automatically, use
# conda config --set anaconda_upload yes
anaconda upload --user i4ds \
    /home/vincenzo/miniconda3/conda-bld/linux-64/ska-gridder-nifty-cuda-0.0.11-py39hf61d1d8_0.tar.bz2 \
    /home/vincenzo/miniconda3/conda-bld/linux-64/ska-gridder-nifty-cuda-0.0.11-py39h9e4a088_0.tar.bz2 \
    /home/vincenzo/miniconda3/conda-bld/linux-64/ska-gridder-nifty-cuda-0.0.11-py39hf6d4435_0.tar.bz2
```
- The correct command for the upload can be found in the output of the `build` command.
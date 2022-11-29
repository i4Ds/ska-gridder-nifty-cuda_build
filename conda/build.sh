mkdir tmp
cd tmp
git clone https://gitlab.com/ska-telescope/sdp/ska-gridder-nifty-cuda.git
cd ska-gridder-nifty-cuda
git checkout --track origin/sim-874-python-wrapper
cd python
$PYTHON -m pip install . --no-deps
$PYTHON -m pip install . --no-deps
cd ..
rm -rf tmp
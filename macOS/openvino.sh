# OpenVINO: maxOS Apple silicon, Intel

export PYVAR=3.9

source ../../dot.rc

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.3 \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_PYTHON=ON \
    -DPYTHON_EXECUTABLE=$HOME/miniforge3/bin/python$PYVAR \
    -DPYTHON_LIBRARY=$HOME/miniforge3/lib/libpython$PYVAR.dylib \
    -DPYTHON_INCLUDE_DIR=$HOME/miniforge3/include/python$PYVAR \
    ..

# end

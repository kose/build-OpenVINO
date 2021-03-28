# OpenCV: macOS Apple silicon, Intel

if test "$PYVAR" = ""; then
    export PYVAR=3.9
fi

source ../../dot.rc

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.3/opencv \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INF_ENGINE=ON \
    -DENABLE_CXX11=ON \
    -DWITH_TBB=ON \
    -DPYTHON3_EXECUTABLE=$HOME/miniforge3/bin/python$PYVAR \
    -DPYTHON3_LIBRARY=$HOME/miniforge3/lib/libpython$PYVAR.dylib \
    -DPYTHON3_INCLUDE_DIR=$HOME/miniforge3/include/python$PYVAR \
    ..

# end



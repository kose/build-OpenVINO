# Ubuntu Raspberry Pi4

export PYVAR=3.8

source ../../dot.rc

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.4.1/opencv \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INF_ENGINE=ON \
    -DENABLE_CXX11=ON \
    -DWITH_TBB=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python$PYVAR \
    -DPYTHON_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython$PYVAR.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python$PYVAR \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    ..

# end

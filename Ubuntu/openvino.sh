# OpenVINO: Ubuntu Raspberry Pi4

export PYVAR=3.8

source ../../dot.rc

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.3 \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SSE42=OFF \
    -DTHREADING=SEQ \
    -DENABLE_GNA=OFF \
    -DENABLE_PYTHON=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python$PYVAR \
    -DPYTHON_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython$PYVAR.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python$PYVAR \
    ..

# end

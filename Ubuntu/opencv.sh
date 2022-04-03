# Ubuntu Raspberry Pi4

python_version=$(python3 -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))')

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2022.1/opencv \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INF_ENGINE=ON \
    -DENABLE_CXX11=ON \
    -DWITH_TBB=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python$python_version \
    -DPYTHON_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython$python_version.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python$python_version \
    ..

# end

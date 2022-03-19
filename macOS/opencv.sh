# OpenCV: macOS Apple silicon, Intel

python_version=$(python3 -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))')

if test ! -x $HOME/miniforge3/bin/python$python_version; then
    echo "No exist: $HOME/miniforge3/bin/python$python_version"
    exit 0
fi

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.4.2/opencv \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_INF_ENGINE=ON \
    -DENABLE_CXX11=ON \
    -DWITH_TBB=ON \
    -DPYTHON3_EXECUTABLE=$HOME/miniforge3/bin/python$python_version \
    -DPYTHON3_LIBRARY=$HOME/miniforge3/lib/libpython$python_version.dylib \
    -DPYTHON3_INCLUDE_DIR=$HOME/miniforge3/include/python$python_version \
    ..

# end



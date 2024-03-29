# Ubuntu Raspberry Pi4

python_version=$(python3 -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))')

(cmake \
     -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2022.1/extras/opencv \
     -DCMAKE_BUILD_TYPE=Release \
     -DWITH_INF_ENGINE=ON \
     -DENABLE_CXX11=ON \
     -DWITH_TBB=ON \
     -DWITH_1394=OFF \
     -DPYTHON_EXECUTABLE=/usr/bin/python$python_version \
     -DPYTHON_LIBRARY=/usr/lib/`arch`-linux-gnu/libpython$python_version.so \
     -DPYTHON_INCLUDE_DIR=/usr/include/python$python_version \
     -DOPENCV_EXTRA_MODULES_PATH=`pwd`/../../opencv_contrib/modules \
     .. \
     && make -j 6) 2>&1 | tee /tmp/`basename $0`.log

# end

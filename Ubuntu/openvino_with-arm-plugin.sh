# OpenVINO: Ubuntu Raspberry Pi4

python_version=$(python3 -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))')

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.4.2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SSE42=OFF \
    -DTHREADING=SEQ \
    -DENABLE_PYTHON=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python$python_version \
    -DPYTHON_LIBRARY=/usr/lib/`arch`-linux-gnu/libpython$python_version.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python$python_version \
    -DIE_EXTRA_MODULES=`pwd`/../../openvino_contrib/modules \
    -DBUILD_java_api=OFF \
    ..

if test ! -f ../scripts/setupvars/setupvars.sh.orig; then
    cd ../scripts/setupvars
    patch --backup --verbose < ../../../setupvars.sh.patch
fi

# end

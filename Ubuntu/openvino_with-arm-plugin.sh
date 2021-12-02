# OpenVINO: Ubuntu Raspberry Pi4

export PYVAR=3.8

source ../../dot.rc

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.4.1 \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SSE42=OFF \
    -DTHREADING=SEQ \
    -DENABLE_GNA=OFF \
    -DENABLE_PYTHON=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python$PYVAR \
    -DPYTHON_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython$PYVAR.so \
    -DPYTHON_INCLUDE_DIR=/usr/include/python$PYVAR \
    -DIE_EXTRA_MODULES=../../openvino_contrib/modules \
    -DBUILD_java_api=OFF \
    -DENABLE_MYRIAD=OFF \
    ..


if test ! -f ../scripts/setupvars/setupvars.sh.orig; then
    cd ../scripts/setupvars
    patch --backup --verbose < ../../../setupvars.sh.patch
fi

# end

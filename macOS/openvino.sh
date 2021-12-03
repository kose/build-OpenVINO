# OpenVINO: maxOS Apple silicon, Intel

if test "$PYVAR" = ""; then
    export PYVAR=3.9
fi

source ../../dot.rc

if test -d $HOME/miniforge3; then
    conda install numpy matplotlib cython pandas scipy scikit-learn pyyaml
fi

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.4.2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_PYTHON=ON \
    -DPYTHON_EXECUTABLE=$HOME/miniforge3/bin/python$PYVAR \
    -DPYTHON_LIBRARY=$HOME/miniforge3/lib/libpython$PYVAR.dylib \
    -DPYTHON_INCLUDE_DIR=$HOME/miniforge3/include/python$PYVAR \
    ..


if test ! -f ../scripts/setupvars/setupvars.sh.orig; then
    cd ../scripts/setupvars
    patch --backup --verbose < ../../../setupvars.sh.patch
fi

# end

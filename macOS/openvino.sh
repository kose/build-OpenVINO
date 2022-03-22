# OpenVINO: maxOS Apple silicon, Intel

python_version=$(python3 -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))')

if test ! -x $HOME/miniforge3/bin/python$python_version; then
    echo "No exist: $HOME/miniforge3/bin/python$python_version"
    exit 0
fi

if test -d $HOME/miniforge3; then
    conda install -y numpy matplotlib cython pandas scipy scikit-learn pyyaml
fi

cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2021.4.2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_PYTHON=ON \
    -DPYTHON_EXECUTABLE=$HOME/miniforge3/bin/python$python_version \
    -DPYTHON_LIBRARY=$HOME/miniforge3/lib/libpython$python_version.dylib \
    -DPYTHON_INCLUDE_DIR=$HOME/miniforge3/include/python$python_version \
    ..


if test ! -f ../scripts/setupvars/setupvars.sh.orig; then
    cd ..
    patch --backup --verbose -p1 < ../openvino.patch
fi

# end

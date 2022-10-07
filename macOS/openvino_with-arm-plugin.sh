# OpenVINO: maxOS Apple silicon, Intel

python_version=$(python3 -c 'import sys; print(str(sys.version_info[0])+"."+str(sys.version_info[1]))')

if test ! -x $HOME/miniforge3/bin/python$python_version; then
    echo "No exist: $HOME/miniforge3/bin/python$python_version"
    exit 0
fi

#
conda install -y numpy matplotlib cython pandas scipy scikit-learn pyyaml pybind11

#
(cmake \
     -DCMAKE_INSTALL_PREFIX=/opt/intel/openvino_2022.2 \
     -DCMAKE_BUILD_TYPE=Release \
     -DENABLE_SSE42=OFF \
     -DTHREADING=SEQ \
     -DENABLE_GNA=OFF \
     -DENABLE_MKL_DNN=ON \
     -DARM_COMPUTE_SCONS_JOBS=4 \
     -DENABLE_PYTHON=ON \
     -DPYTHON_EXECUTABLE=$HOME/miniforge3/bin/python$python_version \
     -DPYTHON_LIBRARY=$HOME/miniforge3/lib/libpython$python_version.dylib \
     -DPYTHON_INCLUDE_DIR=$HOME/miniforge3/include/python$python_version \
     -DIE_EXTRA_MODULES=`pwd`/../../openvino_contrib/modules/arm_plugin \
     .. \
     && make -j 6) 2>&1 | tee /tmp/`basename $0`.log

#
if test ! -f ../scripts/setupvars/setupvars.sh.orig; then
    cd ..
    patch --backup --verbose -p1 < ../setupvars.sh.patch || exit -1
fi

exit 0
# end

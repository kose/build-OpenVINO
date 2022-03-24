## build OpenVINO 2021.4.2

- Intel Mac
    - macOS Monterey / Intel Mac mini

- Docker, Raspberry Pi4
    - Ubuntu 20.10 aarch64

## build

もしビルドエラーになる場合は、 (MacPortでだけ、Homebrewではエラーにならない）
```
[ 58%] Building CXX object ngraph/test/runtime/interpreter/CMakeFiles/interpreter_backend.dir/evaluates_map.cpp.o
In file included from /Users/kose/github/build-OpenVINO-2021.4.2/openvino/ngraph/test/runtime/interpreter/evaluates_map.cpp:25:
/Users/kose/github/build-OpenVINO-2021.4.2/openvino/ngraph/core/reference/include/ngraph/runtime/reference/detection_output.hpp:597:25: error: variable 'numKept' set but not used [-Werror,-Wunused-but-set-variable]
                    int numKept = 0;
                        ^
1 error generated.
```

以下の回避策patchです。

```
--- a/ngraph/core/reference/include/ngraph/runtime/reference/detection_output.hpp
+++ b/ngraph/core/reference/include/ngraph/runtime/reference/detection_output.hpp
@@ -4,6 +4,8 @@
 
 #pragma once
 
+#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
+
 #include <cstddef>
 #include <map>
 #include <string>
```

## Reference

- TBD

 

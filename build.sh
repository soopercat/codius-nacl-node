#!/bin/sh

python tools/js2c.py src/cpp/node_natives.h src/js/*.js

$NACL_SDK_ROOT/toolchain/linux_x86_glibc/bin/x86_64-nacl-g++ -m32 -I/$V8_ROOT/include src/cpp/node_main.cc src/cpp/node.cc src/cpp/util.cc src/cpp/node_constants.cc src/cpp/node_javascript.cc src/cpp/string_bytes.cc src/cpp/node_buffer.cc src/cpp/smalloc.cc src/cpp/node_contextify.cc src/cpp/pipe_wrap.cc -o v8_nacl_module.nexe -L./libs/nacl_ia32.debug -Wl,-rpath=./libs/nacl_ia32.debug -lv8 -lz -gdwarf-2 -O0

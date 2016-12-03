## Clang/LLVM release versions.

LLVM_RELEASE_VERSION := 3.8
LLVM_PREBUILTS_VERSION ?= clang-2812033
LLVM_PREBUILTS_BASE ?= prebuilts/clang/host

## Configure SnapDragon Clang
SDCLANG := true
SDCLANG_PATH := prebuilts/clang/linux-x86/host/sdclang-3.8/bin
SDCLANG_LTO_DEFS := build/core/sdllvm-lto-defs.mk

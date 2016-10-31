# Copyright (C) 2014-2015 UBER
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

################
#Strict Aliasing
################
LOCAL_DISABLE_STRICT := \
	libc_bionic \
	libc_dns \
	libc_tzcode \
	libziparchive \
	libtwrpmtp \
	libfusetwrp \
	libguitwrp \
	busybox \
	libuclibcrpc \
	libziparchive-host \
	libpdfiumcore \
	libandroid_runtime \
	libmedia \
	libpdfiumcore \
	libpdfium \
	bluetooth.default \
	logd \
	mdnsd \
	net_net_gyp \
	libstagefright_webm \
	libaudioflinger \
	libmediaplayerservice \
	libstagefright \
	ping \
	ping6 \
	libdiskconfig \
	libjavacore \
	libfdlibm \
	libvariablespeed \
	librtp_jni \
	libwilhelm \
	libdownmix \
	libldnhncr \
	libqcomvisualizer \
	libvisualizer \
	libutils \
	libandroidfw \
	dnsmasq \
	static_busybox \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support \
	content_content_renderer_gyp \
	third_party_WebKit_Source_modules_modules_gyp \
	third_party_WebKit_Source_platform_blink_platform_gyp \
	third_party_WebKit_Source_core_webcore_remaining_gyp \
	third_party_angle_src_translator_lib_gyp \
	third_party_WebKit_Source_core_webcore_generated_gyp \
	libc_gdtoa \
	libc_openbsd \
	libc \
	libc_nomalloc \
	patchoat \
	dex2oat \
	libart \
	libart-compiler \
	oatdump \
	libart-disassembler \
	linker \
	camera.msm8084 \
	mm-vdec-omx-test \
	libc_malloc \
	mdnsd \
	libstagefright_webm \
	libc_bionic_ndk \
	libc_dns \
	libc_gdtoa \
	libc_openbsd_ndk \
	liblog \
	libc \
	libbt-brcm_stack \
	libandroid_runtime \
	libandroidfw \
	libosi \
	libnetlink \
	clatd \
	ip \
	libc_nomalloc \
	linker \
	sensors.flounder \
	libnvvisualizer \
	libskia \
	libiprouteutil \
	libmmcamera_interface \
	libwifi-service

LOCAL_FORCE_DISABLE_STRICT := \
	libziparchive-host \
	libziparchive \
	libdiskconfig \
	logd \
	libjavacore \
	camera.msm8084 \
	libstagefright_webm \
	libc_bionic_ndk \
	libc_dns \
	libc_gdtoa \
	libc_openbsd_ndk \
	liblog \
	libc \
	libbt-brcm_stack \
	libandroid_runtime \
	libandroidfw \
	libosi \
	libnetlink \
	clatd \
	ip \
	libc_nomalloc \
	linker \
	libc_malloc \
	sensors.flounder \
	libnvvisualizer \
	libiprouteutil \
	libmmcamera_interface \
	libwifi-service

DISABLE_STRICT := \
	-fno-strict-aliasing

STRICT_ALIASING_FLAGS := \
	-fstrict-aliasing \
	-Werror=strict-aliasing

STRICT_GCC_LEVEL := \
	-Wstrict-aliasing=3

STRICT_CLANG_LEVEL := \
	-Wstrict-aliasing=2

# Set Strict Aliasing
ifeq ($(STRICT_ALIASING),true)
  my_cflags := $(filter-out -fno-strict-aliasing,$(my_cflags))
  ifneq (1,$(words $(filter $(LOCAL_DISABLE_STRICT),$(LOCAL_MODULE))))
    ifeq ($(my_clang),true)
      my_cflags += $(STRICT_ALIASING_FLAGS) $(STRICT_GLANG_LEVEL)
    else ifeq ($(my_sdclang),true)
      my_cflags += $(STRICT_ALIASING_FLAGS) $(STRICT_GLANG_LEVEL)
    else
      my_cflags += $(STRICT_ALIASING_FLAGS) $(STRICT_GCC_LEVEL)
    endif
  endif
endif

###############
# Krait Tunings
###############
LOCAL_DISABLE_KRAIT := \
	libc_dns \
	libc_tzcode \
	bluetooth.default \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support

KRAIT_FLAGS := \
	-mcpu=cortex-a15 \
	-mtune=cortex-a15

#############
# GCC Tunings
#############
LOCAL_DISABLE_GCCONLY := \
	bluetooth.default \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support

ifeq (arm,$(TARGET_ARCH))
GCC_ONLY := -O3 \
	-ftree-slp-vectorize \
	-ffunction-sections \
	-DNDDEBUG -pipe \
	-ffp-contract=fast \
	-mvectorize-with-neon-quad \
	-falign-functions=1 -falign-loops=16 -falign-labels=1
			
else
GCC_ONLY := -O3 \
	-ftree-slp-vectorize \
	-ffunction-sections \
	-DNDDEBUG -pipe \
	-ffp-contract=fast \
	-falign-functions=1 -falign-loops=16 -falign-labels=1
			
endif

##########
# GRAPHITE
##########
LOCAL_DISABLE_GRAPHITE := \
	libunwind \
	libFFTEm \
	libicui18n \
	libskia \
	libvpx \
	libmedia_jni \
	libstagefright_mp3dec \
	libart \
	libstagefright_amrwbenc \
	libpdfium \
	libpdfiumcore \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support \
	libjni_filtershow_filters \
	fio \
	libwebrtc_spl \
	libpcap \
	libFraunhoferAAC \
	libhwui

#GRAPHITE_FLAGS := \
	-fgraphite \
	-fgraphite-identity \
	-floop-flatten \
	-floop-parallelize-all \
	-ftree-loop-linear \
	-floop-interchange \
	-floop-strip-mine \
	-floop-block \
	-floop-nest-optimize

ifeq ($(GRAPHITE_OPTS),true)
  ifneq (1,$(words $(filter $(LOCAL_DISABLE_GRAPHITE),$(LOCAL_MODULE))))
    ifneq ($(my_clang),true)
      ifneq ($(my_sdclang),true)
        my_cflags += $(GRAPHITE_FLAGS)
      endif
    endif
  endif
endif


#########
# POLLY #
#########

# Polly flags for use with Clang
POLLY :=-mllvm -polly \
	-mllvm -polly-parallel \
	-mllvm -polly-ast-use-context \
	-mllvm -polly-vectorizer=polly \
	-mllvm -polly-opt-fusion=max \
	-mllvm -polly-opt-maximize-bands=yes \
	-mllvm -polly-run-dce \
	-mllvm -polly-dependences-computeout=0 \
	-mllvm -polly-dependences-analysis-type=value-based \
	-mllvm -polly-run-inliner \
	-mllvm -polly-detect-keep-going \
	-mllvm -polly-rtc-max-arrays-per-group=40

# Those are mostly Bluetooth modules
DISABLE_POLLY_O3 := \
	audio.a2dp.default \
	bdAddrLoader \
	bdt \
        bdtest \
	bluetooth.mapsapi \
        bluetooth.default \
        bluetooth.mapsapi \
	libart \
        libart-compiler \
        libbluetooth_jni \
        libbt% \
        libosi \
        ositests \
	net_bdtool \
        net_hci \
	net_test_btcore \
	net_test_device \
        net_test_osi \
        libxml2

# Disable modules that dont work with Polly. Split up by arch.
DISABLE_POLLY_arm := \
	healthd \
	libaudioflinger \
	libavcdec \
        libavcenc \
	libbnnmlowp \
	libcrypto \
	libcrypto_static \
	libF77blas \
	libFFTEm \
	libFraunhoferAAC \
	libicuuc \
	libinputflinger \
	libjni_filtershow_filters \
	libjni_snapcammosaic \
	libjpeg_static \
	libLLVM% \
	libmpeg2dec \
	libmusicbundle \
	libopus \
	libpdfium% \
	libreverb \
	libRS_internal \
	libsonic \
	libskia_static \
	libstagefright% \
	libv8 \
	libvpx \
	libwebp-decode \
        libwebp-encode \
	libwebrtc% \
	libyuv_static \
	recovery

DISABLE_POLLY_arm64 := \
	$(DISABLE_POLLY_arm) \
	libaudioutils \
	libmedia_jni \
	libRSCpuRef \
	libscrypt_static \
	libsvoxpico

# Set DISABLE_POLLY based on arch
LOCAL_DISABLE_POLLY := \
  $(DISABLE_POLLY_$(TARGET_ARCH)) \
  $(DISABLE_POLLY_O3)

# Set POLLY based on DISABLE_POLLY
ifeq (1,$(words $(filter $(LOCAL_DISABLE_POLLY),$(LOCAL_MODULE))))
  POLLY :=
endif

ifeq ($(my_sdclang), true)
  ifeq ($(my_clang),true)
    my_cflags += -Qunused-arguments
  else
    my_cflags += -Wno-unknown-warning
  endif
else ifeq ($(my_clang),true)
  ifndef LOCAL_IS_HOST_MODULE
    my_cflags := $(filter-out -g,$(my_cflags))
    # Enable Polly if not blacklisted.
    # Don't show unused warning on Clang and GCC
    my_cflags += $(POLLY) -Qunused-arguments
  endif
else
  my_cflags += -Wno-unknown-warning
endif


###########
# O3 OPTS #
###########
ifeq ($(O3_OPTS),true)
  my_cflags := $(filter-out -Wall -Werror -g -O3 -O2 -Os -O1 -O0 -Og -Oz -Wextra -Weverything,$(my_cflags))
  ifeq (1,$(words $(filter $(DISABLE_POLLY_O3),$(LOCAL_MODULE))))
      my_cflags += -O2
  else
      my_cflags += -O3
  endif
else
  my_cflags := $(filter-out -Wall -Werror -g -O3 -O2 -Os -O1 -O0 -Og -Oz -Wextra -Weverything,$(my_cflags))
  my_cflags += -O2
endif

kind: cmake

(@): elements/include/_private/qt.yml

# NOTE: Qt plugin-only dependencies should be put as build dependencies
build-depends:
  (>):
  - freedesktop-sdk.bst:components/jpeg.bst
  - freedesktop-sdk.bst:components/libevdev.bst
  - freedesktop-sdk.bst:components/libinput.bst
  - freedesktop-sdk.bst:components/mtdev.bst
  - freedesktop-sdk.bst:components/xcb-util-cursor.bst
  - freedesktop-sdk.bst:components/xcb-util-image.bst
  - freedesktop-sdk.bst:components/xcb-util-keysyms.bst
  - freedesktop-sdk.bst:components/xcb-util-renderutil.bst
  - freedesktop-sdk.bst:components/xcb-util-wm.bst
  - freedesktop-sdk.bst:components/xcb-util.bst
  - freedesktop-sdk.bst:components/xorg-lib-sm.bst
  - freedesktop-sdk.bst:components/xorg-lib-x11.bst
  - freedesktop-sdk.bst:components/xorg-lib-xcb.bst

depends:
- (@): include/_private/fsdk-depends-type.yml
  filename: fsdk-depends-stacks/qtbase.bst

variables:
  qt-element-name: base

  # cmake/QtBaseHelpers.cmake
  qt-base-opts: >-
    -DBUILD_SHARED_LIBS=ON
    -DWARNINGS_ARE_ERRORS=OFF
    -DQT_CREATE_VERSIONED_HARD_LINK=OFF

  # cmake/QtAutoDetectHelpers.cmake
  qt-auto-detect-opts: >-
    -DBUILD_WITH_PCH=OFF
    -DQT_USE_VCPKG=OFF

  # cmake/QtBuildPathsHelpers.cmake
  # NOTE: INSTALL_PUBLICBINDIR is purposefully left empty
  qt-build-paths: >-
    -DINSTALL_BINDIR=%{qt-bindir}
    -DINSTALL_INCLUDEDIR=%{qt-includedir}
    -DINSTALL_LIBDIR=%{qt-libdir}
    -DINSTALL_CMAKEDIR=%{qt-cmakedir}
    -DINSTALL_MKSPECSDIR=%{qt-mkspecsdir}
    -DINSTALL_SHAREDIR=%{qt-sharedir}
    -DINSTALL_QT_SHAREDIR=%{qt-qt-sharedir}
    -DINSTALL_ARCHDATADIR=%{qt-archdatadir}
    -DINSTALL_PLUGINSDIR=%{qt-pluginsdir}
    -DINSTALL_LIBEXECDIR=%{qt-libexecdir}
    -DINSTALL_QMLDIR=%{qt-qmldir}
    -DINSTALL_DATADIR=%{qt-datadir}
    -DINSTALL_DOCDIR=%{qt-docdir}
    -DINSTALL_TRANSLATIONSDIR=%{qt-translationsdir}
    -DINSTALL_SYSCONFDIR=%{qt-sysconfdir}
    -DINSTALL_EXAMPLESDIR=%{qt-examplesdir}
    -DINSTALL_TESTSDIR=%{qt-testsdir}
    -DINSTALL_DESCRIPTIONSDIR=%{qt-descriptionsdir}
    -DINSTALL_SBOMDIR=%{qt-sbomdir}

  # cmake/QtBuildOptionsHelpers.cmake
  qt-build-opts: >-
    -DQT_BUILD_BENCHMARKS=OFF
    -DQT_BUILD_TESTS=OFF
    -DQT_BUILD_TESTS_BY_DEFAULT=OFF
    -DQT_BUILD_TESTS_BATCHED=OFF
    -DQT_BUILD_MANUAL_TESTS=OFF
    -DQT_BUILD_MINIMAL_STATIC_TESTS=OFF
    -DQT_BUILD_DOC_SNIPPETS=OFF
    -DQT_BUILD_WASM_BATCHED_TESTS=OFF
    -DQT_BUILD_MINIMAL_ANDROID_MULTI_ABI_TESTS=OFF
    -DQT_BUILD_TOOLS_BY_DEFAULT=OFF
    -DQT_BUILD_EXAMPLES=OFF
    -DQT_BUILD_EXAMPLES_BY_DEFAULT=OFF
    -DQT_INSTALL_EXAMPLES_SOURCES=OFF
    -DQT_INSTALL_EXAMPLES_SOURCES_BY_DEFAULT=OFF
    -DQT_DEPLOY_MINIMAL_EXAMPLES=OFF
    -DQT_BUILD_EXAMPLES_AS_EXTERNAL=OFF
    -DQT_BUILD_DOCS=OFF
    -DQT_BUILD_HOST_JAVA_DOCS=OFF
    -DQT_USE_CCACHE=OFF
    -DQT_UNITY_BUILD=OFF
    -DQT_ALLOW_SYMLINK_IN_PATHS=OFF
    -DQT_ALLOW_DOWNLOAD=OFF

  # cmake/QtPublicSbomHelpers
  qt-public-sbom-opts: >-
    -DQT_GENERATE_SBOM=ON
    -DQT_SBOM_GENERATE_SPDX_V2=ON
    -DQT_SBOM_GENERATE_CYDX_V1_6=OFF
    -DQT_SBOM_REQUIRE_GENERATE_CYDX_V1_6=OFF
    -DQT_SBOM_GENERATE_SPDX_V2_JSON=ON
    -DQT_SBOM_REQUIRE_GENERATE_SPDX_V2_JSON=ON
    -DQT_SBOM_VERIFY_SPDX_V2=OFF
    -DQT_SBOM_REQUIRE_VERIFY_SPDX_V2=OFF
    -DQT_SBOM_VERIFY_CYDX_V1_6=OFF
    -DQT_SBOM_REQUIRE_VERIFY_CYDX_V1_6=OFF
    -DQT_SBOM_VERBOSE_CYDX_V1_6=OFF

  # configure.cmake (Architecture related)
  # NOTE: Qt's buildsystem does not look like following compiler flags for those
  qt-base-arch-features: >-
    -DFEATURE_intelcet=OFF
  (?):
  - target_arch == "x86_64":
      # NOTE: Based on x86_64-v2
      qt-base-arch-features: >-
        -DFEATURE_x86intrin=ON
        -DFEATURE_sse2=ON
        -DFEATURE_sse3=ON
        -DFEATURE_ssse3=ON
        -DFEATURE_sse4_1=ON
        -DFEATURE_sse4_2=ON
        -DFEATURE_avx=OFF
        -DFEATURE_f16c=OFF
        -DFEATURE_avx2=OFF
        -DFEATURE_avx512f=OFF
        -DFEATURE_avx512er=OFF
        -DFEATURE_avx512cd=OFF
        -DFEATURE_avx512pf=OFF
        -DFEATURE_avx512dq=OFF
        -DFEATURE_avx512bw=OFF
        -DFEATURE_avx512vl=OFF
        -DFEATURE_avx512ifma=OFF
        -DFEATURE_avx512vbmi=OFF
        -DFEATURE_avx512vbmi2=OFF
        -DFEATURE_aesni=OFF
        -DFEATURE_vaes=OFF
        -DFEATURE_rdrnd=OFF
        -DFEATURE_rdseed=OFF
        -DFEATURE_shani=OFF
        -DFEATURE_intelcet=ON
  - target_arch == "aarch64":
      qt-base-arch-features: >-
        -DFEATURE_neon=ON
        -DFEATURE_arm_crc32=OFF
        -DFEATURE_arm_crypto=OFF
        -DFEATURE_arm_sve=OFF
        -DFEATURE_intelcet=OFF

  # configure.cmake (Module section)
  qt-base-module-features: >-
    -DFEATURE_network=ON
    -DFEATURE_printsupport=OFF
    -DFEATURE_sql=OFF
    -DFEATURE_testlib=OFF
    -DFEATURE_xml=ON

  # configure.cmake
  # NOTE: Some are above and many are skipped
  qt-base-features: >-
    -DFEATURE_pkg_config=ON
    -DFEATURE_system_zlib=ON
    -DFEATURE_zstd=ON
    -DFEATURE_stdlib_libcpp=OFF
    -DFEATURE_dbus=ON
    -DFEATURE_dbus_linked=ON
    -DFEATURE_gui=ON
    -DFEATURE_test_gui=OFF
    %{qt-base-module-features}
    -DFEATURE_widgets=ON
    -DFEATURE_libudev=ON
    -DFEATURE_openssl=ON
    -DFEATURE_openssl_linked=ON
    -DFEATURE_opensslv11=OFF
    -DFEATURE_opensslv30=ON
    %{qt-base-arch-features}

  # src/corelib/configure.cmake
  # NOTE: Many are skipped
  # NOTE: double-conversion and libb2 are built-in
  qt-base-corelib-features: >-
    -DFEATURE_doubleconversion=ON
    -DFEATURE_system_doubleconversion=OFF
    -DFEATURE_glib=ON
    -DFEATURE_system_libb2=OFF
    -DFEATURE_pcre2=ON
    -DFEATURE_system_pcre2=ON
    -DFEATURE_openssl_hash=OFF

  # src/tools/configure.cmake (Deployment section)
  # TODO(Qt 6.12): Add FEATURE_harmonydeployqt=OFF
  qt-base-tools-deployment-features: >-
    -DFEATURE_androiddeployqt=OFF
    -DFEATURE_macdeployqt=OFF
    -DFEATURE_wasmdeployqt=OFF
    -DFEATURE_windeployqt=OFF

  # src/tools/configure.cmake
  qt-base-tools-features: >-
    %{qt-base-tools-deployment-features}
    -DFEATURE_qmake=OFF
    -DFEATURE_qtwaylandscanner=ON

  # src/gui/configure.cmake (Wayland related)
  qt-base-gui-wayland-features: >-
    -DFEATURE_wayland=ON
    -DFEATURE_waylandscanner=ON
    -DFEATURE_wayland_client=ON
    -DFEATURE_wayland_server=OFF
    -DFEATURE_wayland_egl=ON
    -DFEATURE_wayland_brcm=OFF
    -DFEATURE_wayland_drm_egl_server_buffer=ON
    -DFEATURE_wayland_libhybris_egl_server_buffer=OFF
    -DFEATURE_wayland_dmabuf_server_buffer=ON
    -DFEATURE_wayland_shm_emulation_server_buffer=ON
    -DFEATURE_wayland_vulkan_server_buffer=OFF
    -DFEATURE_wayland_client_fullscreen_shell_v1=OFF
    -DFEATURE_wayland_client_wl_shell=OFF
    -DFEATURE_wayland_client_xdg_shell=ON
    -DFEATURE_egl_extension_platform_wayland=ON

  # src/gui/confiqure.cmake (X11 related)
  qt-base-gui-x11-features: >-
    -DFEATURE_egl_x11=ON
    -DFEATURE_xcb=ON
    -DFEATURE_xcb_glx_plugin=OFF
    -DFEATURE_xcb_glx=OFF
    -DFEATURE_xcb_egl_plugin=ON
    -DFEATURE_xcb_xlib=ON
    -DFEATURE_xcb_sm=ON
    -DFEATURE_system_xcb_xinput=ON
    -DFEATURE_xkbcommon_x11=ON
    -DFEATURE_xlib=ON

  # src/gui/configure.cmake
  qt-base-gui-other-platform-features: >-
    -DFEATURE_directfb=OFF
    -DFEATURE_integrityfb=OFF
    -DFEATURE_linuxfb=OFF
    -DFEATURE_vnc=OFF
    -DFEATURE_eglfs=OFF

  # src/gui/configure.cmake
  # NOTE:Many are skipped
  qt-base-gui-features: >-
    -DFEATURE_accessibility=ON
    -DFEATURE_accessibility_atspi_bridge=ON
    -DFEATURE_evdev=ON
    -DFEATURE_freetype=ON
    -DFEATURE_system_freetype=ON
    -DFEATURE_fontconfig=ON
    -DFEATURE_gbm=OFF
    -DFEATURE_harfbuzz=ON
    -DFEATURE_system_harfbuzz=ON
    -DFEATURE_kms=OFF
    -DFEATURE_drm_atomic=OFF
    -DFEATURE_libinput=ON
    -DFEATURE_libinput_axis_api=ON
    -DFEATURE_libinput_hires_wheel_support=ON
    -DFEATURE_integrityhid=OFF
    -DFEATURE_vsp2=OFF
    -DFEATURE_mtdev=ON
    -DFEATURE_opengles2=OFF
    -DFEATURE_opengles3=OFF
    -DFEATURE_opengles31=OFF
    -DFEATURE_opengles32=OFF
    -DFEATURE_opengl_desktop=ON
    -DFEATURE_opengl_dynamic=OFF
    -DFEATURE_dynamicgl=OFF
    -DFEATURE_opengl=ON
    -DFEATURE_vkgen=OFF
    -DFEATURE_vulkan=OFF
    -DFEATURE_vkkhrdisplay=OFF
    -DFEATURE_openvg=OFF
    -DFEATURE_egl=ON
    -DFEATURE_gif=ON
    -DFEATURE_ico=ON
    -DFEATURE_jpeg=ON
    -DFEATURE_system_jpeg=ON
    -DFEATURE_png=ON
    -DFEATURE_system_png=ON
    -DFEATURE_tslib=OFF
    -DFEATURE_tuiotouch=OFF
    -DFEATURE_xkbcommon=ON
    -DFEATURE_textmarkdownreader=ON
    -DFEATURE_system_textmarkdownreader=OFF
    -DFEATURE_pdf=OFF
    %{qt-base-gui-wayland-features}
    %{qt-base-gui-x11-features}
    %{qt-base-gui-other-platform-features}

  # src/widgets/configure.cmake
  # NOTE: style-windows and style-stylesheet are not optional
  # TODO(Qt 6.12): Add FEATURE_style_ohos=OFF
  qt-base-widgets-features: >-
    -DFEATURE_gtk3=OFF
    -DFEATURE_style_fusion=ON
    -DFEATURE_style_mac=OFF
    -DFEATURE_style_windows=ON
    -DFEATURE_style_windowsvista=OFF
    -DFEATURE_style_windows11=OFF
    -DFEATURE_style_android=OFF
    -DFEATURE_style_stylesheet=ON

  # src/network/configure.cmake
  qt-base-network-features: >-
    -DFEATURE_libresolv=ON
    -DFEATURE_libproxy=ON

  cmake-local: >-
    %{qt-base-opts}
    %{qt-auto-detect-opts}
    %{qt-build-paths}
    %{qt-build-opts}
    %{qt-public-sbom-opts}
    %{qt-base-features}
    %{qt-base-corelib-features}
    %{qt-base-tools-features}
    %{qt-base-gui-features}
    %{qt-base-widgets-features}
    %{qt-base-network-features}

sources:
- kind: tar
  url: qt_archive:%{qt-api-version}/%{qt-version}/submodules/qtbase-everywhere-src-%{qt-version}.tar.xz
  ref: d9594a31228aa23ad6b531719a29b45f0f3989fe6c136d45767ea179f233c1ac
- kind: patch
  path: patches/qt-base/0001-QTBUG-146665.patch

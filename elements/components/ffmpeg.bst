kind: make
description: FFmpeg component based on the Freedesktop SDK config

(@):
- elements/include/_private/ffmpeg.yml

build-depends:
  (>):
  - components/amf-headers.bst
  - components/nv-codec-headers.bst

depends:
- (@): include/_private/fsdk-depends-type.yml
  filename: fsdk-depends-stacks/ffmpeg.bst
- components/librist.bst
- components/srt.bst
- components/x264.bst

variables:
  conf-extra: >-
    --enable-encoders
    --enable-decoders
    --disable-programs
    --disable-devices
    --enable-gnutls
    --enable-gpl
    --enable-libx264
    --enable-libopus
    --enable-libvorbis
    --enable-libvpx
    --enable-librist
    --enable-libsrt
    --enable-libaom
    --enable-libsvtav1
    --enable-nvenc
    --enable-amf

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{datadir}/ffmpeg/examples'
        - '%{datadir}/ffmpeg/examples/**'
      obs-unneeded:
      - '%{datadir}/ffmpeg/examples'
      - '%{datadir}/ffmpeg/examples/**'

sources:
- kind: git_repo
  url: github:FFmpeg/FFmpeg.git
  track: n8.1.2
  ref: 38b88335f99e76ed89ff3c93f877fdefce736c13
- kind: patch
  path: patches/ffmpeg/0001-flvdec-handle-unknown.patch
- kind: patch
  path: patches/ffmpeg/0002-libaomenc-presets.patch

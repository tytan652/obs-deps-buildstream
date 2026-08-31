kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - mkdir -p "%{install-root}%{includedir}"
  - cp -r amf/public/include "%{install-root}%{includedir}/AMF"

sources:
- kind: git_repo
  url: github:GPUOpen-LibrariesAndSDKs/AMF.git
  track: v1.5.0
  ref: afed28d37aca1938da2eedc50599bb3535a987ec

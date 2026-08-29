kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- components/mbedtls.bst

variables:
  local_flags: >-
    -Wno-error=discarded-qualifiers

  meson-local: >-
    -Duse_mbedtls=true
    -Dbuiltin_cjson=true
    -Dfallback_builtin=false
    -Dtest=false
    -Dbuilt_tools=false


sources:
- kind: git_repo
  url: code_videolan:rist/librist.git
  ref: 809390b3b75a259a704079d0fb4d8f1b5f7fa956

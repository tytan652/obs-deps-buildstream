kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - mkdir -p "%{install-root}%{includedir}"
  - cp src/* "%{install-root}%{includedir}/."

sources:
- kind: git_repo
  url: github:troydhanson/uthash.git
  track: v2.3.0
  ref: e493aa90a2833b4655927598f169c31cfcdf7861

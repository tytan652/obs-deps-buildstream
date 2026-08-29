kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/git.bst

depends:
- junction: freedesktop-sdk.bst
  (@): include/_private/fsdk-depends-type.yml
  filename:
  - public-stacks/runtime-minimal.bst

variables:
  # Build amalgamation as shared library without early stripping
  make: make amalg BUILDMODE=dynamic TARGET_STRIP=" @:" %{make-args}

public:
  bst:
    split-rules:
      runtime:
        (>):
        - "%{libdir}/lua"
        - "%{libdir}/lua/**"
        - "%{datadir}/lua"
        - "%{datadir}/lua/**"
        - "%{datadir}/luajit-2.1"
        - "%{datadir}/luajit-2.1/**"
      obs-unneeded:
        - "%{bindir}"
        - "%{bindir}/**"
        - "%{debugdir}/bin"
        - "%{debugdir}/bin/**"

sources:
- kind: git_repo
  url: github:LuaJIT/LuaJIT.git
  ref: a4f56a459a588ae768801074b46ba0adcfb49eb1

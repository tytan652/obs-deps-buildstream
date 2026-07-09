kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  # Checklist if bumping Freedesktop SDK release branch:
  # - Check include/strip.yml strip-binaries-base with include/strip.yml with strip-binaries
  # - Check elements/include/_private/ffmpeg.yml with elements/include/ffmpeg.yml
  # - Common plugins in their elements/plugins
  # - Check out elements conf and enviroments if there is something that could be ported
  track: release/25.08
  track-tags: True
  ref: freedesktop-sdk-25.08.14-0-g57149392fe26548b0e7c50a2e171e3aac005a412

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'

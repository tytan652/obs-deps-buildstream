kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  # Update the following if bumping Freedesktop SDK release branch:
  # - elements variables in project.conf
  # - include/autotools-conf.yml
  # - include/strip.yml
  # - elements/include/ffmpeg.yml
  # - Common plugins in elements/plugins
  track: release/25.08
  track-tags: True
  ref: freedesktop-sdk-25.08.7-0-g8287748d639f575825280f6d67eec48d60718efa

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'

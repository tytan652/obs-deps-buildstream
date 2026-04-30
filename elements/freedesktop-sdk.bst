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
  ref: freedesktop-sdk-25.08.11-0-g30517eb37d146e6dcfa1b0e9337ff835e3473ee5

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'

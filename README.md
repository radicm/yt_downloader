# yt_downloader

## Installation

```shell
$ brew install ffmpeg 
# or
$ apt-get install ffmpeg

$ brew install youtube-dl
# or
$ apt-get install youtube-dl

$ gem install yt_downloader
```

## Usage

```shell
$ yt_downloader --help
Commands:
  yt_downloader download 
```

```shell
$ yt_downloader download --help
Command:
  yt_downloader download

Usage:
  yt_downloader download

Description:
  Download audio from you tube video

Options:
  --source=VALUE                        # Chrome json path
  --parser=VALUE                        # Chrome json path: (chrome), default: "chrome"
  --bookmark-tabs=VALUE                 # Chrome json path, default: "music"
  --destination=VALUE                   # Download folder, default: "./yt_downloader/audios"
  --logger-path=VALUE                   # Logger path, default: "./yt_downloader/logs/successful.txt"
  --audio-format=VALUE                  # Audio format: (mp4/flac), default: "mp3"
  --help, -h                            # Print this help  

Examples:
  yt_downloader download --source=/path --parser=chrome --bookmark-tabs=example,example --destination=/path --logger-path=/path audio_format=mp3
```

```shell
$ yt_downloader download 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/radicm/yt_downloader.

## Copyright

[RadicM](https://github.com/radicm) &copy; 2019 - Released under the MIT License

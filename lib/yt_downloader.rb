# frozen_string_literal: true

require 'hanami/cli'
require 'pathname'

require 'yt_downloader/version'
require 'yt_downloader/logger'
require 'yt_downloader/config'
require 'yt_downloader/converter'
require 'yt_downloader/parser'
require 'yt_downloader/downloader'
require 'yt_downloader/downloader/yt_dl'
require 'yt_downloader/parser/chrome'

module YtDownloader
  class CLI
    def call(*args)
      Hanami::CLI.new(Commands).call(*args)
    end

    module Commands
      extend Hanami::CLI::Registry

      class Download < Hanami::CLI::Command
        desc 'Download audio from you tube video'

        option :source, default: nil, desc: 'Chrome json path'
        option :parser, default: YtDownloader::Parser::CHROME, values: [YtDownloader::Parser::CHROME], desc: 'Chrome json path'
        option :bookmark_tabs, default: 'music', desc: 'Chrome json path'
        option :destination, default: YtDownloader::Config.destination_path, desc: 'Download folder'
        option :logger_path, default: YtDownloader::Config.logger_path, desc: 'Logger path'
        option :audio_format, default: YtDownloader::Config.audio_format, values: %w[mp4 flac], desc: 'Audio format'

        example [
                    '--source=/path --parser=chrome --bookmark-tabs=example,example --destination=/path --logger-path=/path audio_format=mp3 '
                ]

        def call(**options)
          # make sure dir structure exists
          Pathname(options.fetch(:destination)).dirname.mkpath
          Pathname(options.fetch(:logger_path)).dirname.mkpath

          bookmark_tabs = options.fetch(:bookmark_tabs).split(',')
          downloader = Downloader.new(Downloader::YTDL, destination: options.fetch(:destination), audio_format: options.fetch(:audio_format))

          Converter.call(downloader: downloader,
                         parser: Parser.new(options.fetch(:parser)),
                         source: options.fetch(:source, nil),
                         bookmark_tabs: bookmark_tabs,
                         logger: Logger.new(options.fetch(:logger_path)))
        end
      end

      register 'download', Download, aliases: ['d']
    end
  end
end

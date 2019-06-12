# frozen_string_literal: true

require 'hanami/cli'

module YtDownloader
  require 'yt_downloader/version'
  require 'yt_downloader/commands'
  require 'yt_downloader/logger'
  require 'yt_downloader/settings'
  require 'yt_downloader/converter'
  require 'yt_downloader/parser/chrome'

  require 'pry'

  class CLI
    def call(*args)
      Hanami::CLI.new(Commands).call(*args)
    end

    module Commands
      extend Hanami::CLI::Registry

      class Download < Hanami::CLI::Command
        desc 'Download audio from you tube video'

        option :source, default:  nil, desc: 'Chrome json path'
        option :parser, default: YtDownloader::Parser::CHROME, values: [YtDownloader::Parser::CHROME], desc: 'Chrome json path'
        option :bookmark_tabs, default: ['music'], desc: 'Chrome json path'
        option :destination, default: YtDownloader::Settings.destination_path, desc: 'Download folder'
        option :logger_path, default: YtDownloader::Settings.logger_path, desc: 'Logger path'
        option :audio_format, default: YtDownloader::Settings.audio_format, values: %w[mp4 flac], desc: 'Audio format'

        example [
          '--source=/path --parser=chrome --bookmark-tabs=example,example --destination=/path --logger-path=/path audio_format=mp3 '
        ]

        def call(**options)
          # make sure dir structure exists
          YtDownloader::Commands.touch(options.fetch(:logger_path))
          YtDownloader::Commands.mkdir(options.fetch(:destination))

          YtDownloader::Converter.run(audio_format: options.fetch(:audio_format),
                                      parser: options.fetch(:parser),
                                      source: options.fetch(:source, nil),
                                      destination: options.fetch(:destination),
                                      bookmark_tabs: bookmark_tabs,
                                      logger: YtDownloader::Logger.new(options.fetch(:logger_path)))
        end
      end

      register 'download', Download, aliases: ['d']
    end
  end
end

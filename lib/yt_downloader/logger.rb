require 'logger'

module YtDownloader
  class Logger
    attr_reader :logger

    def initialize(file_path)
      @logger ||= ::Logger.new(file_path, File::APPEND, datetime_format: '%Y-%m-%d %H:%M:%S')
    end

    def console_print(message)
      puts message
    end

    def info(message)
      @logger.info(message)
    end

    def debug(message)
      @logger.debug(message)
    end

    def warn(message)
      @logger.warn(message)
    end

    def error(message)
      @logger.error(message)
    end
  end
end

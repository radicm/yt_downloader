require 'logger'

module YtDownloader
  class Logger
    attr_reader :logger

    # @param [String] file_path
    # @return [Logger]
    def initialize(file_path)
      @logger = ::Logger.new(file_path, File::APPEND, datetime_format: '%Y-%m-%d %H:%M:%S')
    end

    # @param [String] message
    def console_log(message)
      puts message
    end

    # @param [String] message
    def info(message)
      @logger.info(message)
    end

    # @param [String] message
    def debug(message)
      @logger.debug(message)
    end

    # @param [String] message
    def warn(message)
      @logger.warn(message)
    end

    # @param [String] message
    def error(message)
      @logger.error(message)
    end
  end
end

module YtDownloader
  class Config
    MP3_FORMAT = 'mp3'.freeze
    MP4_FORMAT = 'mp4'.freeze
    FLAC_FORMAT = 'flac'.freeze

    class << self
      #TODO add support for storing config in .yml

      # @return [String]
      def destination_path
        './yt_downloader/audios'
      end

      # @return [String]
      def logger_path
        './yt_downloader/logs/successful.txt'
      end

      # @return [String]
      def audio_format
        MP3_FORMAT
      end

      # @return [Array][String]
      def supported_audio_formats
        [MP3_FORMAT, MP4_FORMAT, FLAC_FORMAT]
      end
    end
  end
end

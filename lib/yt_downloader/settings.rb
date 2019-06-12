module YtDownloader
  class Settings
    MP3_FORMAT = 'mp3'.freeze
    MP4_FORMAT = 'mp4'.freeze
    FLAC_FORMAT = 'flac'.freeze

    class << Settings
      def destination_path
        './yt_downloader/audios'
      end

      def logger_path
        './yt_downloader/logs/successful.txt'
      end

      def audio_format
        MP3_FORMAT
      end

      def supported_audio_formats
        [MP3_FORMAT, MP4_FORMAT, FLAC_FORMAT]
      end
    end
  end
end

module YtDownloader
  class Commands
    class << self
      def mkdir(path)
        `mkdir -p #{path}`
      end

      def touch(file)
        mkdir(`dirname #{file}`.strip)
        `touch #{file}`
      end

      def os
        `echo $(uname -s)`.strip
      end

      def whoami
        `whoami`.strip
      end

      def download_audio(destination, format, bookmark, logger)
        logger.info("Starting download of #{bookmark.name} - #{bookmark.url} in audio #{format}")
        logger.console_print("Downloading #{bookmark.name} - #{bookmark.url}")

        `youtube-dl -x -o #{destination}/%\\(title\\)s.%\\(ext\\)s --audio-format #{format} -f best #{bookmark.url}`

        # `youtube-dl -x -o #{destination} --audio-format #{format} -f best --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' #{link}`
      end
    end
  end
end

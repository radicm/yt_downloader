require 'yt_downloader/downloader/base'

module YtDownloader
  class Downloader
    YTDL = 'ytdl'.freeze

    class YtDl < Base
      def initialize(**options)
        @destination = options.fetch(:destination)
        @audio_format = options.fetch(:audio_format)
      end

      def call(url)
        # `youtube-dl -x -o #{destination}/%\\(title\\)s.%\\(ext\\)s --audio-format #{format} -f best #{bookmark.url}`
        `youtube-dl -x -o #{@destination}/%\\(title\\)s.%\\(ext\\)s --audio-format #{@audio_format} -f best --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' #{url}`
      end
    end
  end
end

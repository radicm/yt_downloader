module YtDownloader
  class Downloader

    # @param [String] downloader
    # @return [Downloader]
    def initialize(downloader, *args)
      @parser = case downloader
                when YtDownloader::Downloader::YTDL
                  YtDownloader::Downloader::YtDl.new(*args)
                else
                  raise "Unsupported #{downloader} parser!"
                end
    end

    # @param [String] url
    def call(url)
      @parser.call(url)
    end
  end
end

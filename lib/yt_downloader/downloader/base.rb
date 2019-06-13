module YtDownloader
  class Downloader
    class Base
      def call
        raise('Override this method!')
      end
    end
  end
end

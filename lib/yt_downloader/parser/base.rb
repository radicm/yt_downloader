module YtDownloader
  module Parser
    class Base
      def self.bookmark_urls(bookmark_tabs, bookmark_path = nil)
        raise 'Override this method!'
      end
    end

    class Bookmark < Struct.new(:url, :name, :tab);
    end
  end
end

module YtDownloader
  class Parser
    class Base

      # @param [Array][String] bookmark_tabs
      # @param [String] bookmark_path
      def self.call(bookmark_tabs, bookmark_path)
        raise 'Override this method!'
      end
    end

    class Bookmark < Struct.new(:url, :name, :tab);
    end
  end
end

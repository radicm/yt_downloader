module YtDownloader
  module Parser
    require 'yt_downloader/parser/base'

    CHROME = 'chrome'.freeze

    class Chrome < Base
      MAC_OSX = 'Darwin'.freeze
      LINUX_OS = 'Linux'.freeze

      def self.bookmark_urls(bookmark_tabs, bookmark_path = nil)
        bookmark_path ||= bookmark_json_path
        bookmark_json = JSON.parse(File.read(bookmark_path), { symbolize_names: true })
        bookmarks = bookmark_json.dig(:roots, :bookmark_bar, :children)

        extract_urls(bookmarks, bookmark_tabs)
      end

      private

      def self.extract_urls(bookmarks, tabs)
        bookmarks.inject([]) do |acc, bookmark|
          if tabs.empty?
            acc.concat(aggregate_bookmarks(bookmark))
          else
            tabs.each do |tab|
              acc.concat(aggregate_bookmarks(bookmark)) if bookmark[:name] == tab
            end
          end

          acc
        end
      end

      def self.bookmark_json_path
        case os
        when LINUX_OS
          "/home/#{whoami}/.config/google-chrome/Default/Bookmarks"
        when MAC_OSX
          "/Users/#{whoami}/Library/Application Support/Google/Chrome/Default/Bookmarks"
        else
          raise 'Unsupported os'
        end
      end

      def self.aggregate_bookmarks(bookmark)
        return [] if bookmark[:children].nil?

        bookmark[:children].map { |b| Bookmark.new(*(b.values_at(:url, :name) << bookmark[:name])) }
      end

      # Stub methods for testing
      #
      #
      def self.os
        Commands.os
      end

      def self.whoami
        Commands.whoami
      end
    end
  end
end

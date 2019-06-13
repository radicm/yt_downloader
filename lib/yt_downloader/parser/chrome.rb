require 'yt_downloader/parser/base'
require 'json'

module YtDownloader
  class Parser

    CHROME = 'chrome'.freeze

    class Chrome < Base
      MAC_OSX = 'Darwin'.freeze
      LINUX_OS = 'Linux'.freeze

      # @param [Array][String] bookmark_tabs
      # @param [String] bookmark_path
      def self.call(bookmark_tabs, bookmark_path)
        bookmark_path ||= bookmark_json_path
        bookmark_json = JSON.parse(File.read(bookmark_path), { symbolize_names: true })
        bookmarks = bookmark_json.dig(:roots, :bookmark_bar, :children)

        extract_urls(bookmarks, bookmark_tabs)
      end

      private

      # @param [Array][Hash] bookmarks
      # @param [Array][String] tabs
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

      # @return [String]
      def self.bookmark_json_path
        case os
        when LINUX_OS
          "/home/#{whoami}/.config/google-chrome/Default/Bookmarks"
        when MAC_OSX
          "/Users/#{whoami}/Library/Application Support/Google/Chrome/Default/Bookmarks"
        else
          raise "Unsupported #{os} os!"
        end
      end

      # @param [Hash] bookmark
      # @return [Array][Bookmark]
      def self.aggregate_bookmarks(bookmark)
        return [] if bookmark[:children].nil?

        bookmark[:children].map { |b| Bookmark.new(*(b.values_at(:url, :name) << bookmark[:name])) }
      end

      # NOTE: Stub methods for testing
      #
      #
      # @return [String]
      def self.os
        `echo $(uname -s)`.strip
      end

      # @return [String]
      def self.whoami
        `whoami`.strip
      end
    end
  end
end

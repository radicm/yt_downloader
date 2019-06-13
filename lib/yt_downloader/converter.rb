module YtDownloader
  class Converter

    # @param [String] audio_format
    # @param [Parser] parser
    # @param [String] source
    # @param [String] destination
    # @param [Array][String] bookmark_tabs
    # @param [Logger] logger
    def self.call(downloader:, parser:, source:, bookmark_tabs:, logger:)
      logger.info('Parsing bookmark urls')
      bookmarks = parser.call(bookmark_tabs, source)

      bookmarks.each_with_index do |bookmark, i|
        logger.console_log("[#{i + 1}/#{bookmarks.count}] #{bookmark.name} - #{bookmark.url}")
        logger.info("Starting download of #{bookmark.name} - #{bookmark.url}")

        downloader.call(bookmark.url)
      end
      logger.console_log('Finished!')
    end
  end
end

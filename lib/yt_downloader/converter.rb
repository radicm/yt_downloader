module YtDownloader
  class Converter
    def self.run(audio_format:, parser:, source:, destination:, bookmark_tabs:, logger:)
      bookmarks = case parser
             when YtDownloader::Parser::CHROME
               logger.info('Parsing Chrome bookmark urls')
               YtDownloader::Parser::Chrome.bookmark_urls(bookmark_tabs, source)
             else
               logger.error("Unsupported #{parser} parser!")
               raise 'Unsupported parser!'
             end

      bookmarks.each_with_index do |bookmark, i|
        print("[#{i+1}/#{bookmarks.count}] ")
        YtDownloader::Commands.download_audio(destination, audio_format, bookmark, logger)
      end
    end
  end
end

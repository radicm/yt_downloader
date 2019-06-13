module YtDownloader
  class Parser

    # @param [String] parser
    # @return [Parser]
    def initialize(parser)
      @parser = case parser
                when YtDownloader::Parser::CHROME
                  YtDownloader::Parser::Chrome
                else
                  raise "Unsupported #{parser} parser!"
                end
    end

    # @param [Array][String] bookmark_tabs
    # @param [String] source
    def call(bookmark_tabs, source)
      @parser.call(bookmark_tabs, source)
    end
  end
end

require 'spec_helper'

describe YtDownloader::Parser::Chrome do

  subject { described_class.bookmark_urls(bookmarks, bookmark_path) }

  context '' do
    let(:bookmarks) { ['music'] }
    let(:bookmark_path) { nil }

    it '' do
      expect(subject).to eq([])
    end
  end
end

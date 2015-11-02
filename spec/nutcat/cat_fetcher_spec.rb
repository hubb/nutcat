require 'spec_helper'
require 'nutcat/cat_fetcher'

describe Nutcat::CatFetcher do
  describe 'class' do
    specify { expect(described_class).to respond_to(:fetch) }
  end

  subject(:fetcher) { described_class.new('foo', '/tmp/foo') }

  specify { expect(fetcher).to respond_to(:fetch) }
  specify { expect(fetcher).to respond_to(:path) }

  describe 'fetch' do
    let(:http) { ->(*) { 'foo' } }
    
    it 'writes whatever the http call returns into a file' do
      tmp     = Tempfile.new('cat.jpg')
      path    = Pathname.new(tmp)
      fetcher = described_class.new(
        "http://foo.bar/#{path.basename.to_s}",
        path.dirname.to_s
      ).tap { |f| f.http = http }

      fetcher.fetch
      tmp.rewind

      expect(tmp.read).to eq(http.call)

      tmp.unlink
    end
  end
end
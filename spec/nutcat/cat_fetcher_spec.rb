require 'spec_helper'
require 'nutcat/cat_fetcher'

describe Nutcat::CatFetcher do
  describe 'class' do
    specify { expect(described_class).to respond_to(:fetch) }
  end

  describe 'fetch' do
    let(:io) { StringIO.new('') }
    
    subject(:fetcher) do
      described_class.new("http://foo.bar/foo.bar", io).tap { |f|
        f.http = ->(*) { 'foo' }
      }
    end

    specify { expect(fetcher.fetch).to be_truthy }

    it 'writes whatever the http call returns into the given io' do
      expect { fetcher.fetch }.to change { io.string }.to('foo')
    end
  end
end
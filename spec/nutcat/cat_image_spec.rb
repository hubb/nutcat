require 'spec_helper'
require 'nutcat/cat_image'

describe Nutcat::CatImage do
  subject(:image) { described_class.new }

  specify { is_expected.to respond_to(:to_s) }
  specify { is_expected.to respond_to(:image) }
  specify { is_expected.to respond_to(:parser=) }
  specify { is_expected.to respond_to(:url) }
  specify { is_expected.to respond_to(:source_url) }
  specify { is_expected.not_to respond_to(:parser) }

  describe 'to_s' do
    let(:img) {
      described_class::Image.new(
        'http://foo.bar/foobar.png',
        'http://foo.lan/foobar.png'
      )
    }
    before { image.parser = ->(_) { img } }

    it 'aliases to source_url' do
      expect(image.to_s).to eq(image.source_url)
    end
  end

  describe 'image' do
    let(:xml) {
      "<?xml version=\"1.0\"?>\n<response>\n  <data>\n    <images>\n      <image>\n        <url>http://28.media.tumblr.com/tumblr_m029tyDUCG1qjahcpo1_250.jpg</url>\n        <id>117</id>\n        <source_url>http://thecatapi.com/?id=117</source_url>\n      </image>\n    </images>\n  </data>\n</response>\n"
    }
    before { image.http = ->(_) { xml } }

    specify { expect(image).to respond_to(:url) }
    specify { expect(image).to respond_to(:source_url) }

    describe 'url' do
      specify { expect(image.url).to be_a(String) }
    end

    describe 'source_url' do
      specify { expect(image.source_url).to be_a(String) }
    end
  end
end

require 'spec_helper'
require 'nutcat/cat'

describe Nutcat::Cat do
  subject(:cat) { described_class.new }

  specify { is_expected.to respond_to(:img) }
  specify { is_expected.to respond_to(:save) }
  specify { is_expected.to respond_to(:fact) }
  specify { is_expected.to respond_to(:filename) }

  describe 'img' do
    # Calling the ineterwebs here
    specify { expect(cat.img).to be_a(String) }
  end

  describe 'fact' do
    # Calling the ineterwebs here
    specify { expect(cat.fact).to be_a(String) }
  end

  describe 'save' do
    before { cat.fetcher = ->(f) { f } }

    context 'when the fetcher returns true' do
      let(:fetcher) { double(fetch: true, path: '/tmp/bar.png') }

      specify { expect(cat.save(fetcher)).to be_truthy }
    end

    context 'when the fetcher returns false' do
      let(:fetcher) { double(fetch: false, path: '/tmp/bar.png') }

      specify { expect(cat.save(fetcher)).to be_falsey }
    end
  end
end
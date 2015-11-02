require 'spec_helper'
require 'nutcat/cat'

describe Nutcat::Cat do
  subject(:cat) { described_class.new }

  specify { is_expected.to respond_to(:img) }
  specify { is_expected.to respond_to(:save) }
  specify { is_expected.to respond_to(:fact) }

  describe 'img' do
    # Calling the ineterwebs here
    specify { expect(cat.img).to be_a(String) }
  end

  describe 'fact' do
    # Calling the ineterwebs here
    specify { expect(cat.fact).to be_a(String) }
  end

  describe 'save' do
    context 'CatFetcher returns true' do
      let(:fetcher) { double(fetch: true, path: '/tmp/bar.png') }

      before do
        allow(Nutcat::CatFetcher).to receive(:new).and_return(fetcher)
      end

      specify { expect(cat.save('/tmp')).to eq('File saved to /tmp/bar.png') }
    end

    context 'CatFetcher returns false' do
      let(:fetcher) { double(fetch: false, path: '/tmp/bar.png') }

      before do
        allow(Nutcat::CatFetcher).to receive(:new).and_return(fetcher)
      end

      specify {
        expect(cat.save('/tmp'))
          .to eq('An error occurend, unable to write to /tmp/bar.png')
      }
    end
  end
end
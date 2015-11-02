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
    xspecify { expect(cat.fact).to be_a(String) }
  end
end
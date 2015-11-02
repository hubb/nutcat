require 'spec_helper'
require 'nutcat/cat_image'

describe Nutcat::CatImage do
  subject(:image) { described_class.new }

  xspecify { is_expected.to respond_to(:to_s) }
end

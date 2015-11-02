require 'spec_helper'
require 'nutcat/connection'

describe Nutcat::Connection do
  let(:proxy) { Class.new { include Nutcat::Connection } }
  subject(:connectable) { proxy.new }

  specify { is_expected.to respond_to(:http=) }
  specify { is_expected.not_to respond_to(:http) }
end
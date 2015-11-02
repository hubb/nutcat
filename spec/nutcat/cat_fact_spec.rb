require 'spec_helper'
require 'nutcat/cat_fact'

describe Nutcat::CatFact do
  subject(:fact) { described_class.new }

  specify { is_expected.to respond_to(:http=) }
  specify { is_expected.to respond_to(:to_s) }
  specify { is_expected.to respond_to(:fact) }
  specify { is_expected.not_to respond_to(:http) }

  describe 'fact' do
    let(:json) { "{\"facts\": [\"On September 6,1950, a four-month-old kitten belonging to Josephine Aufdenblatten of Geneva, Switzerland followed a group of climbers to the top of the 14,691 -ft. Matterhorn in the Alps.\"], \"success\": \"true\"}" }
    before     { fact.http = ->(uri) { json } }

    specify { expect(fact.fact).to be_a(String) }

    context 'when the response is not parseable' do
      let(:json) { "".to_json }

      specify { expect(fact.fact).to be_a(String) }
    end

    context 'when the response has no facts' do
      let(:json) { "{\"facts\": [], \"success\": \"false\"}" }

      specify { expect(fact.fact).to be_a(String) }
    end
  end
end
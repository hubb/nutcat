module FakeStd
  def self.out
    @out ||= StringIO.new("")
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.around do |example|
    if new_stdout = example.metadata[:stdout]
      old_stdout = $stdout
      $stdout    = FakeStd.out
    end

    example.run

    if new_stdout
      $stdout, old_stdout = old_stdout, nil
    end
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.warnings = true
  config.default_formatter = 'doc'
  config.order = :random
  Kernel.srand config.seed
end

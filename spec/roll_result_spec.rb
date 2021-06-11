# spec/roll_result_spec.rb

require 'rspec'
require_relative '../roll_result'

RSpec.describe RollResult do
  let(:description) { "Die 1: 6-sided" }
  let(:values) { [3] }
  let(:result) { RollResult.new(description, values) }

  describe '#initialize' do
    it 'initializes with a description and values' do
      expect(result.description).to eq(description)
      expect(result.values).to eq(values)
      expect(result.total).to eq(values.sum)
    end
  end

  describe '#to_s' do
    it 'returns a formatted string representation of the result' do
      expect(result.to_s).to eq("Die 1: 6-sided: 3 | Total: 3")
    end
  end
end

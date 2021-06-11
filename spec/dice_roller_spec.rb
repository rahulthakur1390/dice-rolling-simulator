# spec/dice_roller_spec.rb

require 'rspec'
require_relative '../dice_roller'

RSpec.describe DiceRoller do
  let(:dice_roller) { DiceRoller.new }

  describe '#roll' do
    it 'rolls a single 6-sided die' do
      result = dice_roller.roll([6])
      expect(result.values.first).to be_between(1, 6)
      expect(result.description).to eq("Die 1: 6-sided")
    end

    it 'rolls two 8-sided dice' do
      result = dice_roller.roll([8, 8])
      expect(result.values.size).to eq(2)
      expect(result.values[0]).to be_between(1, 8)
      expect(result.values[1]).to be_between(1, 8)
      expect(result.description).to eq("Die 1: 8-sided, Die 2: 8-sided")
    end

    it 'rolls one 6-sided die and one 20-sided die' do
      result = dice_roller.roll([6, 20])
      expect(result.values[0]).to be_between(1, 6)
      expect(result.values[1]).to be_between(1, 20)
      expect(result.description).to eq("Die 1: 6-sided, Die 2: 20-sided")
    end

    it 'raises an ArgumentError if a die has 0 sides' do
      expect { dice_roller.roll([0]) }.to raise_error(ArgumentError, "Number of sides must be greater than 0")
    end
  end
end
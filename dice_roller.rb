class DiceRoller
  attr_reader :descriptions, :values

  def roll(dice)
    description = build_description(dice)
    values = dice.map { |sides| roll_die(sides) }
    RollResult.new(description, values)
  end

  private

  def roll_die(sides)
    raise ArgumentError, "Number of sides must be greater than 0" if sides <= 0
    rand(1..sides)
  end

  def build_description(dice)
    dice.map.with_index { |sides, index| "Die #{index + 1}: #{sides}-sided" }.join(', ')
  end
end

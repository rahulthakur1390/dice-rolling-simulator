# class DiceRoller

#   def roll(dice)
#     values = []
#     dice.each.with_index(1) do |sides, counter|
#       value = roll_die(sides)
#       values << value
#       puts build_description(counter, sides, value)
#     end
#     puts "Total of values: #{values.sum}"
#   end

#   private

#   def roll_die(sides)
#     raise ArgumentError, "Number of sides must be greater than 0" if sides <= 0
#     rand(1..sides)
#   end

#   def build_description(counter, sides, value)
#     "Die #{counter} (#{sides}-sided): has value #{value}"
#   end
# end

# dice_roller = DiceRoller.new
# # Roll a single 6-sided die
# dice_roller.roll([6])

# # Roll two 8-sided dice
# dice_roller.roll([8, 8])

# # Roll one 6-sided die and one 20-sided die
# dice_roller.roll([6, 20])



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

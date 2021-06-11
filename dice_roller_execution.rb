require_relative 'roll_result'
require_relative 'dice_roller'



# # Roll a single 6-sided die
# result1 = dice_roller.roll([6])
# puts result1

# # Roll two 8-sided dice
# result2 = dice_roller.roll([8, 8])
# puts result2

# # Roll one 6-sided die and one 20-sided die
# result3 = dice_roller.roll([6, 20])
# puts result3

def initiate_execution
  puts "Welcome to the Dice Roller!"
  puts "Specify no's of dice are to be rolled"
  get_dice_count()
end

def get_dice_count
  dice_count = gets.chomp
  dice_count = Integer(dice_count) rescue false
  if dice_count && dice_count >= 1
  	get_dice_sides(dice_count)
  else
    puts 'Invalid input, Please re-enter positive integer as input'
    get_dice_count()
  end
end

def get_dice_sides(dice_count)
  sides = []
  (1..dice_count).each do |counter|
    puts "Please enter side for Die #{counter}"
    side = gets.chomp
    side = Integer(side) rescue false
    if side && side >= 1
	    sides << side
	  else
	    puts 'Invalid input, Please try again'
	    return initiate_execution()
	  end
  end
  dice_roller = DiceRoller.new
  result = dice_roller.roll(sides)
  puts result
end

initiate_execution()




require_relative 'roll_result'
require_relative 'dice_roller'

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

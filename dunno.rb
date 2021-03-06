require './dice.rb'
require './DiceExtend.rb'
require './Rand'
arr = []
gen_5 = Proc.new do
	5.times {arr.push(Rand.true_rand(6))}
end
gen_3 = Proc.new do
	3.times do 
			arr.push(Rand.true_rand(6))
		until arr.join.to_i <= 612
			arr = []
			3.times {arr.push(Rand.true_rand(6))}
		end
	end
end
quit = nil
until quit == "quit"
yn = nil
puts "Would you like to use words and symbols in your password?"
puts "If no, random letters and symbols will be used"
until yn == "yes" || yn == "no"
yn = gets.chomp.downcase
if yn == "yes"
	puts "How many words/symbols do you want in your password?"
	puts "Please enter value in number format(1,2,3...etc)"
	u = gets.chomp.to_i
	until u >= 1
		puts "I'm sorry, you need to put in a valid number"
		u = gets.chomp.to_i
	end
	puts "What would you like seperating your words?"
	puts "Push any key (or combination of keys) followed by enter"
	sep = gets.chomp
	print "Your randomly generated password is: "
	proccount = 0
	until proccount == u
		gen_5.call
		word = arr.join
		print Dice.get(word.to_i) + sep
		arr = []
		proccount += 1
	end
	print "\n-----------------------------------------------------------------\n"
elsif yn == "no"
	puts "How long would you like your password to be?"
	puts "Please enter value in number format(1,2,3...etc)"
	u = gets.chomp.to_i
	until u >= 1
		puts "I'm sorry, you need to put in a valid number"
		u = gets.chomp.to_i
	end
	print "Your randomly generated password is: "
	proccount = 0
	until proccount == u
		gen_3.call
		word = arr.join
		print DiceExtend.get_sym(word.to_i)
		arr = []
		yn = "no"
		proccount += 1
	end
	print "\n-----------------------------------------------------------------\n"
else
		puts "I'm sorry, try again. This is a simple yes or no question."
	end
	end
	puts "Type quit to close the program"
	puts "Anything else will generate another password"
	quit = gets.chomp.downcase
	if quit == "quit"
		puts "Goodbye!"
		sleep(5)
	end
end
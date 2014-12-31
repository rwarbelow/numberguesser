require_relative 'printer'
require_relative 'evaluator'

printer = Printer.new
puts printer.welcome
input = gets.chomp

until input == "q"
	if input == "p"
		evaluator = Evaluator.new
		evaluator.generate_number
		puts printer.take_guess
		input = gets.chomp
		until input == 'q'
			if evaluator.correct_guess?(input.to_i)
				puts printer.winning_message
				break
			elsif evaluator.too_high?(input.to_i)
				puts printer.too_high
			elsif evaluator.too_low?(input.to_i)
				puts printer.too_low
			else
				puts printer.invalid_command
			end
			input = gets.chomp
		end
		puts printer.end_of_round
	elsif input == "i"
		puts printer.instructions
	else
		puts printer.invalid_command
	end
	input = gets.chomp
end

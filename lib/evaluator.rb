class Evaluator
	attr_reader :printer, :game_in_progress
	attr_accessor :number

	def initialize(input_printer)
		@printer = input_printer
		@game_in_progress = false
	end

	def execute(command)
		if game_in_progress
			game_play(command)
		else
			game_menu(command)
		end
	end

	def game_play(command)
		if command == "q"
			@game_in_progress = false
			return [printer.end_of_round, :continue]
		end

		guess = command.to_i

		if correct_guess?(guess)
			@game_in_progress = false
			[printer.winning_message, :continue]
		elsif too_high?(guess)
			[printer.too_high, :continue]
		elsif too_low?(guess)
			[printer.too_low, :continue]
		else
			[printer.invalid_command, :continue]
		end
	end

	def game_menu(command)
		case command
		when "q" then
			[printer.goodbye, :stop]
		when "p" then
			generate_number
			@game_in_progress = true
			[printer.take_guess, :continue]
		when "i" then
			[printer.instructions, :continue]
		else
			[printer.invalid_command, :continue]
		end
	end

	def generate_number
		@number = rand(1..20)
	end

	def too_high?(guess)
		guess > number
	end

	def too_low?(guess)
		guess < number
	end

	def correct_guess?(guess)
		guess == number
	end
end

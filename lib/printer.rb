class Printer
	def take_guess
		"Choose a number between 1 and 20."
	end

	def winning_message
		"Congratulations! You won."
	end

	def end_of_round
		"This round is over. Would you like to play again? Press 'p' to play or 'q' to quit."
	end

	def too_high
		"Sorry, your guess is too high."
	end

	def too_low
		"Sorry, your guess is too low."
	end

	def instructions
		"Enter 'p' to play.\nEnter 'i' for instructions.\nEnter 'q' to quit."
	end

	def invalid_command
		"Sorry, I do not understand that command."
	end

	def welcome
		"Welcome to NumberGuesser!\n#{instructions}"

	end
end

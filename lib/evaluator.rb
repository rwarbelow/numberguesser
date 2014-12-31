class Evaluator
	attr_reader :number
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

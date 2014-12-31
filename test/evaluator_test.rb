require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/evaluator'

class EvaluatorTest < Minitest::Test
	def test_it_exists
		assert Evaluator
	end

	def test_it_starts_a_game
		printer = Printer.new
		evaluator = Evaluator.new(printer)

		assert evaluator.number.nil?, "A game should start with no secret number"

		evaluator.execute("p") # Start a game from the menu

		assert evaluator.number, "A started game should have a number"
	end

	def test_guess_is_too_high
		skip
		evaluator = Evaluator.new
		evaluator.stub :number, 5 do
			assert evaluator.too_high?(8)
    end

	end

	def test_guess_is_too_low
		skip
		evaluator = Evaluator.new
		evaluator.stub :number, 5 do
			assert evaluator.too_low?(3)
    end
	end

	def test_guess_is_correct
		skip
		evaluator = Evaluator.new
		evaluator.stub :number, 5 do
			assert evaluator.correct_guess?(5)
    end
	end
end

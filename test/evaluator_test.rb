require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/evaluator'

class EvaluatorTest < Minitest::Test
	def test_it_exists
		assert Evaluator
	end

	def test_it_generates_a_number
		evaluator = Evaluator.new
		number = evaluator.generate_number
		assert number.is_a?(Integer)
		assert (1..20).include?(number)
	end

	def test_guess_is_too_high
		evaluator = Evaluator.new
		evaluator.stub :number, 5 do
			assert evaluator.too_high?(8)
    end
		
	end

	def test_guess_is_too_low
		evaluator = Evaluator.new
		evaluator.stub :number, 5 do
			assert evaluator.too_low?(3)
    end
	end

	def test_guess_is_correct
		evaluator = Evaluator.new
		evaluator.stub :number, 5 do
			assert evaluator.correct_guess?(5)
    end
	end
end

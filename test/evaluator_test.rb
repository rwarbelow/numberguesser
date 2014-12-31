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
		printer = Printer.new
		evaluator = Evaluator.new(printer)
		evaluator.execute("p")

		evaluator.number = 5

		message, signal = evaluator.execute("7")
		assert message.include?("high"), "A too high guess should say something about 'high'"
		assert_equal :continue, signal
	end

	def test_guess_is_too_low
		printer = Printer.new
		evaluator = Evaluator.new(printer)
		evaluator.execute("p")

		evaluator.number = 5

		message, signal = evaluator.execute("3")
		assert message.include?("low"), "A too low guess should say something about 'low'"
		assert_equal :continue, signal
	end

	def test_guess_is_correct
		printer = Printer.new
		evaluator = Evaluator.new(printer)
		evaluator.execute("p")

		evaluator.number = 5

		evaluator.execute("6")
		evaluator.execute("4")

		message, signal = evaluator.execute("5")
		assert message.include?("won"), "A winning guess should say something about 'won'"
		assert_equal :continue, signal
	end

	def test_quit_from_menu
		printer = Printer.new
		evaluator = Evaluator.new(printer)

		message, signal = evaluator.execute("q")
		assert message.include?("Thanks"), "A quit message should say something about 'Thanks'"
		assert_equal :stop, signal
	end

	def test_quit_round_in_game
		printer = Printer.new
		evaluator = Evaluator.new(printer)
		evaluator.execute("p")

		message, signal = evaluator.execute("q")
		assert message.include?("over"), "A round-quit message should say something about 'over'"
		assert_equal :continue, signal
	end
end

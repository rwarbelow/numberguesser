require_relative 'printer'
require_relative 'evaluator'

printer = Printer.new
evaluator = Evaluator.new(printer)

puts printer.welcome

signal = :go

while signal != :stop
  input = gets.chomp
  response, signal = evaluator.execute(input)
  puts response
end

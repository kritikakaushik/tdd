# string_calculator.rb

class StringCalculator
    def self.add(input)
      return 0 if input.empty?
      return input.to_i if input.size == 1
  
      numbers = input.split(",").map(&:to_i)
      numbers.sum
    end
  end
  
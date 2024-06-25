# string_calculator.rb

class StringCalculator
    def self.add(input)
        return 0 if input.empty?
    
        delimiter = extract_delimiter(input)
        numbers = extract_numbers(input, delimiter)
        validate_numbers(numbers)
    
        numbers.sum
    end

    private 
    
    def self.extract_delimiter(input)
        delimiter = ","
        if input.start_with?("//")
          delimiter = input[2]
          input = input.split("\n", 2).last
        end
        delimiter
    end

    def self.extract_numbers(input, delimiter)
        input.gsub!(/\n/, delimiter)
        input.split(delimiter).map(&:to_i)
    end

    def self.validate_numbers(numbers)
        negatives = numbers.select { |num| num < 0 }
        raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    end
  end
  
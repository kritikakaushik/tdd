# spec/string_calculator_spec.rb

require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself if there is only one number" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two comma-separated numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple comma-separated numbers" do
      expect(StringCalculator.add("1,2,3")).to eq(6)
    end

    it "handles new lines between numbers" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports different delimiters specified in the input" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an exception for negative numbers and shows all negatives in the message" do
      expect { StringCalculator.add("-1,2,-3") }.to raise_error(RuntimeError, "Negative numbers not allowed: -1, -3")
    end
  end
end

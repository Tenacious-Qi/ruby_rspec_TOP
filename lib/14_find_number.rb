# frozen_string_literal: true

# class for computer to find random number
class FindNumber
  attr_reader :answer, :min, :max, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max))
    @min = min
    @max = max
    @answer = answer
  end

  def make_guess
    (min + max) / 2
  end

  def game_over?
    @guess == answer.value
  end

  def update_range
    if @guess < answer.value
      @min = @guess + 1
    elsif @guess > answer.value
      @max = @guess - 1
    end
  end
end

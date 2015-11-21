#
# x - 1. add in hot as a criteria
# 1.5. further refine evaluate_guess by calling function for
#      evaluate_heat, evaluate_direction
# 2. make it so that after every guess the answer moves randomly by 1
#


def get_response(prompt)
  print prompt
  $stdout.flush
  gets
end

#
# @param guess [Integer] the user's guess
# @param answer [Integer] the answer selected by the computer
# @return [Symbol] this is the evaluation of the comparison, either (:hot, :cold, or :warm)
#
def evaluate_hotness(guess, answer)
  #evaluation.push(evaluate_heat(guess, answer))
  #evaluation.push(evaluate_direction(guess, answer))

  # add a line
  #refactor starting here
  #difference = guess - answer
  #rating, if abs = 0 then correct
  # if abs = 1, then hot
  # if abs 1 < 3, then warm
  # if abs > 3, then cold
  if (guess - answer).abs > 3
    :cold
  elsif (guess - answer).abs == 1
    :hot
  elsif (guess - answer).abs == 0
    :correct
  else
    :warm
  end
end

def evaluate_direction(guess, answer)
  if guess < answer then
    :low
  else
    :high
  end
end

def evaluate_response(guess_evaluation)
  case guess_evaluation
  when :correct
    nil
  when [:cold, :low]
    "you're cold and too low"
  when [:cold, :high]
    "you're cold and too high"
  when [:warm, :low]
    "you're warm but too low"
  when [:warm, :high]
    "you're warm but too high"
  when [:hot, :low]
    "you're hot but too low"
  when [:hot, :high]
    "you're hot but too high"
  end
end

def evaluate_guess(guess, answer)
  if answer == guess then
    return :correct
  else
    evaluation = []

    evaluation.push(evaluate_hotness(guess, answer))
    evaluation.push(evaluate_direction(guess, answer))
    
    return evaluation
  end
  #refactor ending here
end

def assert(expr)
  if !expr
    raise "assertion failed"
  end
end

def assert_eq(expr1, expr2)
  if expr1 != expr2
    raise "got = #{expr1} and expected = #{expr2}"
  end
end

assert(evaluate_response([:hot, :low]) == "you're hot but too low")

assert(evaluate_hotness(5, 5) == :correct)
assert(evaluate_hotness(4, 5) == :hot)
assert(evaluate_hotness(6, 5) == :hot)
assert(evaluate_hotness(3, 5) == :warm)
assert(evaluate_hotness(1, 5) == :cold)
assert(evaluate_hotness(5, 8) == :warm)
assert(evaluate_hotness(5, 9) == :cold)

assert_eq(evaluate_guess(5, 5), :correct)
assert_eq(evaluate_guess(3, 5), [:warm, :low])
assert_eq(evaluate_guess(7, 5), [:warm, :high])
assert_eq(evaluate_guess(1, 5), [:cold, :low])
assert_eq(evaluate_guess(9, 5), [:cold, :high])


loop do
  answer = Random.rand(10)
  loop do
    guess = get_response("enter a guess between 0 and 9: ").to_i

    result = evaluate_response(evaluate_guess(guess, answer))
    break if result.nil?
    puts result
  end

  continue = get_response("play again y/n: ").to_s

  if continue[0].downcase == "n"
    break
  end
end

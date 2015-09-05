#
# 1. add in hot as a criteria
# 1.5. further refine evaluate_guess by calling function for
#      evaluate_heat, evaluate_direction
# 2. make it so that after every guess the answer moves randomly by 1
#


def get_response(prompt)
  print prompt
  $stdout.flush
  gets
end

def evaluate_guess(guess, answer)
  if answer == guess then
    return :correct
  else
    evaluation = []

    # add a line
    #refactor starting here
    #difference = guess - answer
    #rating, if abs = 0 then correct
    # if abs = 1, then hot
    # if abs 1 < 3, then warm
    # if abs > 3, then cold
    def evaluate_response(temperature, degree)
    if (guess - answer).abs > 3
      evaluation.push(:cold)
    elsif (guess - answer).abs == 1
      evaluation.push(:hot)
    else
      evaluation.push(:warm)
    end

    if guess < answer then
      degree = (:low)
    else
      degree = (:high)
    end
    return evaluation
    when [:cold, :low]
      puts "you're cold and too low"
    when [:cold, :high]
      puts "you're cold and too high"
    when [:warm, :low]
      puts "you're warm but too low"
    when [:warm, :high]
      puts "you're warm but too high"
    when [:hot, :low]
      puts "you're hot but too low"
    when [:hot, :high]
      puts "you're hot but too high"
    end
  #refactor ending here
end

def assert(expr)
  if !expr
    raise "assertion failed"
  end
end

assert(evaluate_guess(5, 5) == :correct)
assert(evaluate_guess(3, 5) == [:warm, :low])
assert(evaluate_guess(7, 5) == [:warm, :high])
assert(evaluate_guess(1, 5) == [:cold, :low])
assert(evaluate_guess(9, 5) == [:cold, :high])


loop do
  answer = Random.rand(10)
  loop do
    guess = get_response("enter a guess between 0 and 9: ").to_i

    guess_evaluation = evaluate_guess(guess, answer)
    case guess_evaluation
    when :correct
      break
    incorrectness_evaluation = evaluate_response(temperature, degree)
    case incorrectness_evaluation

  end

  continue = get_response("play again y/n: ").to_s

  if continue[0].downcase == "n"
    break
  end
end

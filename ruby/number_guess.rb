random_num = rand(100)  # generate a random number

num_of_guesses = 0  # store number of guesses

print("Hey, may I know your first name? ")
name = gets.chomp          # remove the extra new line character
name = name.capitalize()   # make the first letter capital

while num_of_guesses < 10
  print("\nGuess a number from 1 to 100: ")
  guess_num = gets.to_i
  # gets return as string datatype, hence we need to convert to integer

  num_of_guesses = num_of_guesses + 1
  # you can write above as num_of_guesses += 1
  guesses_left = (10 - num_of_guesses)

  if guess_num < random_num
    puts("#{name}, your guess was low, enter a higher number. You have #{guesses_left} guesses left.")
  elsif guess_num > random_num
    puts("#{name}, your guess was high, enter a lower number. You have #{guesses_left} guesses left.")
  end

  break if guess_num == random_num
end

if guess_num == random_num
  puts("Good job, #{name}! You guessed the number in #{num_of_guesses} tries.")
else
  puts("#{name}, you failed to guess correctly. Actual number is #{random_num}.")
end


=begin
# --- output ---
$ ruby number_guess.rb
Hey, may I know your first name? brg

Guess a number from 1 to 100: 50
Brg, your guess was high, enter a lower number. You have 9 guesses left.

Guess a number from 1 to 100: 30
Brg, your guess was low, enter a higher number. You have 8 guesses left.

Guess a number from 1 to 100: 40
Brg, your guess was high, enter a lower number. You have 7 guesses left.

Guess a number from 1 to 100: 35
Brg, your guess was high, enter a lower number. You have 6 guesses left.

Guess a number from 1 to 100: 31
Good job, Brg! You guessed the number in 5 tries.
=end

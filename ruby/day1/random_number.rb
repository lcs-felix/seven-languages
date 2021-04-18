number = rand(10)

puts "Your guess:"
guess = gets.to_i

if guess > number
  puts "too high"
  exit
elseif guess < number
  puts "too low"
  exit
end

puts "right!"

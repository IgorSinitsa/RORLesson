puts "Как Вас зовут?"
user_name = gets.chomp
puts "Какой Ваш рост?"
user_height = gets.chomp.to_i
puts "Какой у Вас вес?"
user_weight = gets.chomp.to_i
ideal_weight = (user_height - 110) * 1.15

if ideal_weight >= user_weight
  puts "#{user_name} у Вас идеальный вес"
else
  puts "#{user_name} Ваш идеальный вес должен быть #{ideal_weight}, вам нужно немного сбросить #{user_weight - ideal_weight}"
end

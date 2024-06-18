puts "Решение уравнения вида ax2 + bx + c = 0"
puts "Введите коэффициенты"
puts "а"
a = gets.chomp.to_i
puts "b"
b = gets.chomp.to_i
puts "c"
c = gets.chomp.to_i
d = b ** 2 - 4 * a * c
if d < 0
  puts "Дискриминант равен #{d}, корней нет"
  elseif d == 0
  puts "Дискриминант равен 0, поэтому корень один #{(-b / (2 * a))}"
else
  puts "Дискриминант равен #{d}, первый корень #{((-b - Math.sqrt(d)) / (2 * a))}, второй #{((-b + Math.sqrt(d)) / (2 * a))}"
end

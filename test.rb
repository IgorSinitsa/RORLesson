puts "Введите длины трех сторон треугольника"
puts "Сторону а"
a = gets.chomp.to_i
puts "Сторону b"
b = gets.chomp.to_i
puts "Сторону c"
c = gets.chomp.to_i
if a == b and b == c and a == c
  puts " все 3 стороны равны, треугольник равнобедренный и равносторонний "
  puts a, b, c
else
  p_c = c
  p_b = b
  p_a = a
  if p_c < p_b
    p_c = b
    p_b = c
  end
  if p_c < p_a
    p_a = c
    p_c = a
  end
  puts " 2 стороны равны, треугольник равнобедренный " if (a == b || b == c || a == c)
  puts " треугольник прямоугольный" if (p_c ** 2 == (p_a ** 2 + p_b ** 2))
end

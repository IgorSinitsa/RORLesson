# Сумма покупок. Пользователь вводит поочередно название товара,
# цену за единицу и кол-во купленного товара (может быть нецелым числом).
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп"
# в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
# а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
products = {}
alltotal = 0
loop do
  puts "Введите наименование товара"
  product = gets.chomp
  break if product == "стоп"
  puts "Введите количество товара"
  quantity = gets.chomp.to_f
  puts "Введите стоимость товара"
  price = gets.chomp.to_f
  products[product] = { quantity: quantity, price: price, total: quantity * price }
end
products.each do |prodactname, producttotal|
  puts "Товар #{prodactname}"
  puts producttotal
  puts "Итого за товар #{producttotal[:total]}"
  alltotal += producttotal[:total]
end
puts "За все покупки #{alltotal}"

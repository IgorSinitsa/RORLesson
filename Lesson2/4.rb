# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
letters = ["a", "e", "i", "o", "u", "y"]
vocarr = ("a".."z").to_a
vochash = {}
letters.each { |letter| vochash[letter] = vocarr.index(letter) + 1 }
puts vochash

# Заполнить массив числами фибоначчи до 100
i = 2
arr = [1, 1]
fab = 0
while fab < 100
  fab = arr[i - 1] + arr[i - 2]
  arr.push(fab)
  i += 1
end
arr.delete_at(-1)
puts arr

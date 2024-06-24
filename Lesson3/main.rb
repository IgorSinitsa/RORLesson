require "./type_train.rb"
require "./route.rb"
require "./train.rb"
gryz1 = TypeTrain.new("грузовой", 10)
gryz2 = TypeTrain.new("пасажирский", 20)
gryz3 = TypeTrain.new("скорый", 4, 100)
# puts gryz1.name, gryz1.numberofcarriage
train1 = Train.new("66", gryz1)
train2 = Train.new("77", gryz2)
train3 = Train.new("88", gryz1)
train4 = Train.new("8866", gryz3)
train5 = Train.new("88444", gryz1)
# puts train1.name, train1.numberofcarriage, train1.speed
# train1.outcarriage
# puts train1.name, train1.numberofcarriage, train1.speed
# train1.outcarriage
# puts train1.name, train1.numberofcarriage, train1.speed
# train1.upspeed
# puts train1.name, train1.numberofcarriage, train1.speed
# train1.stop
# puts train1.name, train1.numberofcarriage, train1.speed

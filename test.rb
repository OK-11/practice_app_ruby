require_relative "main/goods"

class Aaa
  attr_accessor :list
  def have_list(goods)
    @list = goods
  end
end

ozawa = Aaa.new
goods = [
  #(ID,名前,価格,個数)
  Goods.new(1,"リンゴ",100,10),
  Goods.new(2,"メロン",500,10),
  Goods.new(3,"イチゴ",300,10),
  Goods.new(4,"スイカ",600,10),
  Goods.new(5,"ミカン",50,10)
]
ozawa.have_list(goods)

test = ozawa.list.find do |goods|
  goods.id == 2
end

copy = test.dup

p ozawa.list[1].object_id
p test.object_id
p copy.object_id
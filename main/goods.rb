class Goods
  attr_accessor :id , :name , :price , :number
  def initialize(id,name,price,number)
    @id = id
    @name = name
    @price = price
    @number = number
  end
end
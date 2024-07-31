module List
  attr_accessor :list
  def have_list(goods=[])
    @list = goods
  end
  
  def show_list
    @list.each do |goods|
      puts "|#{goods.id}       |#{goods.name}            |#{goods.price}|#{goods.number}  |"
    end
  end

  def add_list(goods,number)
    addgoods = goods
    addgoods.number = number
    @list[@list.length] = addgoods
  end

  def set_list(id,number)
    @list.each do |goods|
      if goods.id == id
        goods.number = goods.number - number
      end
    end
  end
end
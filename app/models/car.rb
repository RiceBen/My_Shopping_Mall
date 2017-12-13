#購物車類別
class Car
  attr_reader :items
  #初始化購物車
  def initialize
    @items = []
  end

  #新增品項
  def add_item(product_id)
    found_item = @items.find { |item| item.product_id == product_id }
    
        if found_item
          found_item.increment
        else
          @items << CarItem.new(product_id)
        end
  end

  def items
    @items
  end

  #判斷購物車是否為空
  def empty?
    return @items.empty?
  end
end

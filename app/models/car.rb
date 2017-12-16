#購物車類別
require 'json'

class Car
  attr_reader :items
  #初始化購物車
  def initialize(hash = [])
    @items = hash
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

  def total_amount
    result = @items.reduce(0) { |sum, item| 
      sum += item.total_price 
    }
    
  case 
    when xmas?
      if result >= 1000
        return result * 0.9
      end
    else
      return result
    end
  end

  def serialize
    item_list = items.map { |item|
      { "product_id" => item.product_id, "quantity" => item.quantity }
    }

    { "items" => item_list }
  end

  def self.from_hash(hash)
    all_items = []
    if hash && hash["items"]
      all_items = hash["items"].map { |item|
        CarItem.new(item["product_id"], item["quantity"])
      }
    end

    new(all_items)
  end

private
  def xmas?
    Time.now.month == 12 && Time.now.day == 25
  end
end

require 'rails_helper'

RSpec.describe CarItem, type: :model do
  context "基本功能" do
    let(:car){Car.new}

    it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變。" do
      3.times { car.add_item 1 }
      3.times { car.add_item 2 }
      2.times { car.add_item 1 }

      expect(car.items.count).to be 2
      expect(car.items.first.quantity).to be 5
    end

    it "每個 Cart Item 都可以計算它自己的金額（小計）。" do
      p1 = Product.create(title:"ruby", price: 100)
      3.times{car.add_item p1.id}

      expect(car.items.first.total_price).to be 300
    end

  end
end

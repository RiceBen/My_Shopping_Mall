require 'rails_helper'

RSpec.describe Car, type: :model do
  context "基本功能" do
    let(:car){Car.new}

    it "可以把商品都到購物車裡，購物車就會有東西了" do
      car.add_item(1)

      expect(car).not_to be_empty
    end

    it "商品可以放到購物車裡，也可以再拿出來。" do
      p1 = Product.create(title:"ruby", price: 100)
      p2 = Product.create(title:"csharp", price: 500)

      3.times{car.add_item p1.id}
      car.add_item p2.id

      expect(car.items.first.product).to be_a Product
      expect(car.items.last.product_id).to be p2.id
    end

    it "可以計算整台購物車的總消費金額。" do
      p1 = Product.create(title:"ruby", price: 100)
      p2 = Product.create(title:"csharp", price: 500)

      3.times{car.add_item p1.id}
      car.add_item p2.id

      expect(car.total_amount).to be 800
    end

    it "特別活動可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百或滿額免運費）。" do
      p1 = Product.create(title:"ruby", price: 100)
      p2 = Product.create(title:"csharp", price: 500)

      5.times{car.add_item p1.id}
      car.add_item p2.id
      
      xmas = Time.local(2017, 12, 25, 12, 0, 0)
      Timecop.travel(xmas) do
        expect(car.total_amount).to be (1000 * 0.9)
      end
    end

    # 進階功能
    # 可以將購物車內容轉換成 Hash 並存到 Session 裡。
    # 也可以存放在 Session 的內容（Hash 格式），還原成購物車的內容。

  end
end

class CarItem
    #存放 數量 與 商品序號
    attr_reader :product_id, :quantity
    
      def initialize(product_id, quantity = 1)
        @product_id = product_id
        @quantity = quantity
      end
    
      def increment(n = 1)
        @quantity += n
      end
    
end
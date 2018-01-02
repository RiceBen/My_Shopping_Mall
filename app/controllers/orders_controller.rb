class OrdersController < ApplicationController
    def create
        nonce = params[:payment_method_nonce]

        # create order
        order = Order.new(order_param)
        current_car.items.each do |item|
            order.order_items.build(product: item.product,
            quantity: item.quantity)
        end

        
    if order.save
    #empty shopping car
    session[:car9527] = nil

    #credit card

    #leave
    redirect_to product_path
    else
    end

    end

    private
    def order_params
        params.require(:order).permit(
            :receipent, 
            :tel, 
            :address, 
            :email
        )
    end
end

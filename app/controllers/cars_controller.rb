class CarsController < ApplicationController
    include CarsHelper
    def add
        
        current_car.add_item(params[:id])
        session[:cart9527] = cart.serialize
    
        redirect_to products_path, notice: "商品已加入購物車!"
    end

    def show

    end

    def checkout
        @order = Order.new
    end

    def destory
        session[:car9527] = nil
        redirect_to products_path, notice: "購物車已清空！"
    end
    
end

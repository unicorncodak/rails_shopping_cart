class CartsController < ApplicationController
  # GET /carts/1 or /carts/1.json
  def show
    @cart = @current_cart
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  
end

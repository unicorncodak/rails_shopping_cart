require 'faraday'
class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    if @current_cart.line_items.length > 0
      @order = Order.new
    else
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(order_params)
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    total = (@current_cart.sub_total + 5) * 100
    redirect_to pay_path(total, order_params["email"])
  end

  def success
    if params[:success].present?
      @success = params[:success]
    end
  end

  def pay
    amount = params[:amount]
    email = params[:email]
    response = Faraday.post('https://api.paystack.co/transaction/initialize') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = 'Bearer sk_test_63341df1f9e77cfe13260ab0e228ea2e1174b515'
      req.body = {amount:"#{amount}", email:"#{email}", callback_url:"http://localhost:3000/orders/verify_payment"}.to_json
    end
    result = JSON.parse response.body
    if result["status"] == true
      redirect_to result["data"]["authorization_url"]
    end
    
  end

  def verify_payment
    if params[:reference]
      response = Faraday.get("https://api.paystack.co/transaction/verify/#{URI::escape(params[:reference])}") do |req|
        req.headers['Authorization'] = 'Bearer sk_test_63341df1f9e77cfe13260ab0e228ea2e1174b515'
      end
      result = JSON.parse response.body
      if result["data"]["status"] == "success"
        redirect_to action: 'success', success: "Payment completed successfully"
      end
    else
      redirect_to root_path
    end
    
  end
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address, :pay_method)
    end
end

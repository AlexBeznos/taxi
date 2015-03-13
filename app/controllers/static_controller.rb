class StaticController < ApplicationController
  def index
    @order = Order.new
  end

  def calculate
    @info = Geo.new(order_params).get_info
    hash = {'cost' => @info[:cost],
            'distance' => @info[:distance].to_f}
    hash.merge!(order_params)
    @order = Order.create(hash)
  end

  def call
    @order = Order.find(params[:id])
    @order.sended!
  end

  def decline
    @order = Order.find(params[:id])
    @selects = Order.circumstances.keys.to_a
    @selects.shift()
  end

  def decline_answer
    @order = Order.find(params[:id])
    @order.declined!
    @order.update(order_params)
    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:from_street, :from_house, :to_street, :to_house, :cost, :distance, :circumstances)
  end
end

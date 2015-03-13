class StaticController < ApplicationController
  def index
    @order = Order.new
  end

  def calculate
    @info = Geo.new(order_params).get_info
    hash = {'cost' => @info[:cost],
            'distance' => @info[:distance].to_f}
    hash.merge!(order_params)
    Order.create(hash)
  end

  def call
  end

  private
  def order_params
    params.require(:order).permit(:from_street, :from_house, :to_street, :to_house, :cost, :distance)
  end
end

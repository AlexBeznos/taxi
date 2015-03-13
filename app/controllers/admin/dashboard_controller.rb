class Admin::DashboardController < AdminAppController
  def index
    @orders = Order.sended.order(created_at: :desc)
  end

  def declined
    @orders = Order.declined
  end

  def destroy_order
    @order = Order.find(params[:id])
    if @order.update(deleted: true)
      redirect_to admin_path, notice: 'Order was successfully hidden!'
    else
      redirect_to admin_path, notice: 'Something went wrong!'
    end
  end
end

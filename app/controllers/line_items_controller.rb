class LineItemsController < ApplicationController

  def create
    @line_items = LineItem.create(line_items_params)
    redirect_to cart_path(line_item.cart_id)
  end

  def destroy
    @line_items = LineItem.find(params[:id])
    @line_items.destroy
    redirect_to cart_path(line_item.cart_id)
  end

  private

  def line_items_params
    params.require(:line_items).permit(:product_id, :cart_id, :quantity)
  end



end

class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart
    else
      render :new
    end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html {redirect_to products_path, notice: "Your item was successfully deleted."}
  end

  def update
    @cart = Cart.find(params[:id])
    respond_to do |format|
    format.html { redirect_to @cart }
    end
  end


  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end


end

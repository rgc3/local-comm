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
    respond_to do |format|
    if @cart.save
      format.html { redirect_to @cart, notice: "Cart was successfully created" }
    else
      format.html render :new
      end
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Your item was successfully deleted." }
  end

  def update
    @cart = Cart.find(params[:id])
      respond_to do |format|
        if @cart.update(cart_params)
          format.html { redirect_to @cart, notice: "Your item was successfully updated." }
        else
          format.html { render :edit }
      end
    end
  end


  end

  private

  def cart_params
    params.require(:cart).permit(:user_id)
  end


end

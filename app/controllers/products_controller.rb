class ProductsController < ApplicationController 
 before_action :set_product, only: [:show, :edit, :update, :destroy]

   def show 
    
   end 

   def index 
    @products = Product.all
   end 

   def new 
    @product = Product.new 
   end 

   def edit 
    
   end 

   def create 
    @product = Product.new(params)
    if @product.save
      flash[:notice] = "Products was created succesfully"
      redirect_to @product
    else   
      render 'new'
    end 
  end 

  def update 
   
    if @product.update(params)
      flash[:notice] = "Product was updated succesfully"
      redirect_to @product
    else  
      render 'edit'
    end 
  end 
  
  def destroy 
    
    @product.destroy 
    redirect_to products_path
  end

  private 

  def set_product
    @product = Product.find(params[:id])
  end
  
  def params 
    params.require(:product).permit(:title, :description)
  end
end
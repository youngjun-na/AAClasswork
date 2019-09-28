class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @kitty = Cat.find(params[:id])
    render :show
  end

  def new
    @kitty = Cat.new  
    render :new
  end

  def create
    
    kitty = Cat.new(cat_params)
    if kitty.save
      redirect_to cat_url(kitty)
    else          
      redirect_to new_cat_url
    end
  end

  def edit
    @kitty = Cat.find(params[:id])
    render :edit
  end

  def update
    kitty = Cat.find(params[:id])
    if kitty.update(cat_params)
      redirect_to cat_url(kitty)
    else          
      redirect_to edit_cat_url(kitty)
    end
  end




  private
  
  def cat_params
    params.require(:cat).permit(:id, :description, :birth_date, :sex, :color, :name)
  end
end

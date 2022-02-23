class ItemsController < ApplicationController
  before_action :move_to_index, except: :index


  def index
    @items = Item.all
    @dry = Item.where(genre_id:1)
    @oily = Item.where(genre_id:2)
    @nikibi = Item.where(genre_id:3)
    @rankup = Item.where(genre_id:4)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:title, :explanation, :genre_id, :image)
    .merge(user_id: current_user.id)
  end
end

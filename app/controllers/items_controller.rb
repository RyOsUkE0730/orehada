class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_id, only: [:show, :destroy]

  def index
    @items = Item.all
    @dry = Item.where(genre_id: 1).order('id ASC').limit(7)
    @oily = Item.where(genre_id: 2).order('id ASC').limit(7)
    @nikibi = Item.where(genre_id: 3).order('id ASC').limit(7)
    @rankup = Item.where(genre_id: 4).order('id ASC').limit(7)
    @user = User.find(current_user.id) if user_signed_in?
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

  def show
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:id, :title, :explanation, :genre_id, :image)
          .merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_id
    @item = Item.find(params[:id])
  end
end

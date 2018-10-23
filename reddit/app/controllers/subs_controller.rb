class SubsController < ApplicationController
  # before_action :ensure_logged_in

  def new
    @s = Sub.new
  end

  def create
    @s = Sub.new(sub_params)
    @s.user_id = current_user.id
    if @s.save
      redirect_to sub_url(@s)
    else
      flash.now[:errors] = @s.errors.full_messages
      render :new
    end
  end

  def show
    @s = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def edit
    @s = Sub.find(params[:id])
  end

  def update
    @s = current_user.subs.find(params[:id])
    if @s.update
      redirect_to sub_url(@s)
    else
      flash.now[:errors] = @s.errors.full_messages
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end

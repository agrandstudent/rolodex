class UsersController < ApplicationController
  def index
    render :json => User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render :json => user
    else
      render :json => user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    render :json => User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render :json => user
    else
      render :json => user.errors.full_messages, :status => :unprocessable_entity
    end

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render :json => user
  end

  def favorites
   render :json => Contact.favorite_contacts_for_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end

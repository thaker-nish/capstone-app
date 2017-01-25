class UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to "/users/#{user.id}"
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @promoter_followers = PromoterFollower.where(user_id: @user.id)
    if current_promoter || current_user.id === @user.id
      render 'show.html.erb'
  elsif current_user
    redirect_to "/users/#{current_user.id}"
  else
    redirect_to '/login'
    end
  end
end

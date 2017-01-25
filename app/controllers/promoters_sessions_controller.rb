class PromotersSessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    promoter = Promoter.find_by(email: params[:email])
    if promoter && promoter.authenticate(params[:password])
      session[:promoter_id] = promoter.id
      flash[:success] = 'Successfully logged in!'
      redirect_to "/promoters/#{promoter.id}"
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/promoters_login'
    end
  end

  def destroy
    session[:promoter_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/'
  end
end

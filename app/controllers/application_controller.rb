class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_promoter
    @current_promoter ||= Promoter.find_by(id: session[:promoter_id]) if session[:promoter_id]
  end
  helper_method :current_promoter
  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def authenticate_promoter!
    unless current_promoter
      redirect_to '/promoters_login'
      return
    end
  end

  def locations
    @locations = Location.all
  end
  helper_method :locations

  def promoter_followers
    @promoter_followers = PromoterFollower.where(user_id: current_user.id, promoter_id: params[:id])
  end
  helper_method :promoter_followers
end

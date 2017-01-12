class PromotersController < ApplicationController
  before_action :authenticate_promoter!, except: [:index, :show, :new, :create]
  def index
    @promoters = Promoter.all 
    render 'index.html.erb'
  end

  def create
    promoter = Promoter.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if promoter.save
      session[:user_id] = promoter.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/promoters_signup'
    end
  end
  
  def show
    @promoter = Promoter.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new_promotion
    render 'new_promotion.html.erb'
  end

  def create_promotion
    Promotion.create(
      name: params[:name],
      club_name: params[:club_name],
      promoter_id: current_promoter.id
    )
    redirect_to "/promoters/#{current_promoter.id}"
  end

  def new_guestlist
    render 'new_guestlist.html.erb'
  end

  def create_guestlist
    Guestlist.create(
      club_id: params[:club_id],
      promoter_id: current_promoter.id,
      user_id: params[:user_id],
      promotion_id: params[:promotion_id],
      guests: params[:guests],
      reservation_date: params[:reservation_date]
    )
    redirect_to "/promoters/#{current_promoter.id}"
  end
end

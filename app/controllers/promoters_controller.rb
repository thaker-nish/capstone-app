class PromotersController < ApplicationController
  before_action :authenticate_promoter!, except: [:index, :show, :new, :create, :create_follow, :destroy_unfollow, :create_comment]
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
    @comment = Comment.where(promoter_id: params[:id])
    @user = User.all
    if current_user || current_promoter
      render 'show.html.erb'
  else
    redirect_to '/login'
    end
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
    date_info = params["reservation_date"]
    user = User.find_by(email: params[:user_email])
    Guestlist.create(
      club_id: params[:club_id],
      promoter_id: current_promoter.id,
      user_id: user.id,
      promotion_id: params[:promotion_id],
      guests: params[:guests],
      reservation_date: DateTime.new(
        date_info["reservation_date(1i)"].to_i,
        date_info["reservation_date(2i)"].to_i,
        date_info["reservation_date(3i)"].to_i
      ).strftime("%m/%d/%Y")
    )
    redirect_to "/promoters/#{current_promoter.id}"
  end

  def create_follow
    PromoterFollower.create(user_id: current_user.id, promoter_id: params[:promoter_id])
    redirect_to "/promoters/#{params[:promoter_id]}"
  end

  def destroy_unfollow
    # @promoter_follower = PromoterFollower.where(user_id: current_user.id).where(promoter_id: params[:id])
    @promoter_followers = PromoterFollower.where(user_id: current_user.id, promoter_id: params[:id])
    @promoter_followers.first.destroy
    flash[:success] = 'Product successfully destroyed!'
    redirect_to "/promoters/#{params[:id]}"
  end

  def new_club
    render 'new_club.html.erb'
  end

  def create_club
    ClubPromoter.create(
      club_id: params[:club_id],
      promoter_id: current_promoter.id
      )
    redirect_to "/promoters/#{current_promoter.id}"
  end

  def create_comment
    Comment.create(
      body: params[:body],
      promoter_id: params[:promoter_id],
      user_id: current_user.id
      )
    redirect_to "/promoters/#{params[:promoter_id]}"
  end
end

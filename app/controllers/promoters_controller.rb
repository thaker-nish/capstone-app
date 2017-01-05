class PromotersController < ApplicationController
  def index
    @promoters = Promoter.all 
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
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
      redirect_to '/promoter_signup'
    end
  end

  def show
    @promoter = Promoter.find_by(id: params[:id])
    render 'show.html.erb'
  end
end

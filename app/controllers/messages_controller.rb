class MessagesController < ApplicationController
  before_action :authenticate_user! unless :authenticate_promoter!
  def new
    render 'new.html.erb'
  end

  def create
    Message.create(
      body: params[:body],
      promoter_id: params[:promoter_id] || current_promoter.id,
      user_id: params[:user_id] || current_user.id
      )
  end

  def show
    # @messages = UserMessage.where(promoter_id: params[:id] || current_promoter.id, user_id: params[:id] || current_user.id).order(created_at: :desc) && PromoterMessage.where(promoter_id: params[:id] || current_promoter.id, user_id: params[:id] || current_user.id).order(created_at: :desc)
    if current_user
      # Promoter.all.each do |promoter|

      # end
      @user_messages = UserMessage.where(user_id: current_user.id, promoter_id: params[:id]).order(created_at: :desc)
      @promoter_messages = PromoterMessage.where(user_id: current_user.id, promoter_id: params[:id]).order(created_at: :desc)
    elsif current_promoter
      @user_messages = UserMessage.where(promoter_id: current_promoter.id, user_id: params[:id]).order(created_at: :desc)
      @promoter_messages = PromoterMessage.where(promoter_id: current_promoter.id, user_id: params[:id]).order(created_at: :desc)
    end
    @messages = []
    @user_messages.each do |user_message|
      @messages.push({sender_name: user_message.user.name, body: user_message.body, created_at: user_message.created_at.strftime("%e %b %Y %H:%M:%S%p")})
    end
    @promoter_messages.each do |promoter_message|
      @messages.push({sender_name: promoter_message.promoter.name, body: promoter_message.body, created_at: promoter_message.created_at.strftime("%e %b %Y %H:%M:%S%p")})
      @messages = @messages.sort_by { |message| message[:created_at] }
    end
    @user = User.find_by(id: params[:id])
    @promoter = Promoter.find_by(id: params[:id])
  end

  def create_user_message
    UserMessage.create(
      body: params[:body],
      promoter_id: params[:promoter_id],
      user_id: current_user.id
      )
    redirect_to "/messages/#{params[:promoter_id]}"
  end

  def create_promoter_message
    PromoterMessage.create(
      body: params[:body],
      promoter_id: current_promoter.id,
      user_id: params[:user_id]
      )
    redirect_to "/messages/#{params[:user_id]}"
  end
end
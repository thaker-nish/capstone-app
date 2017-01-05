class ClubsController < ApplicationController
  def index
    @clubs = Club.all
    render 'index.html.erb'
  end

  def show
    @club = Club.find_by(id: params[:id])
    render 'show.html.erb'
  end
end

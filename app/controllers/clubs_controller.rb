class ClubsController < ApplicationController
  def index
    @clubs = Club.all
    render 'index.html.erb'
  end

  def show
    @club = Club.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def index_locations
    @locations = Location.all
    render 'index_locations.html.erb'
  end

  def show_locations
    @location = Location.find_by(id: params[:id])
    render 'show_locations.html.erb'
  end
end

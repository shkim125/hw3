class PlacesController < ApplicationController
  def index
    @places = Place.all
    @entries = Entry.all
  end
  
  def show
    @place = Place.find_by({"id" => params["id"]})
    @entries = Entry.where({"place_id" => @place["id"]})
    render :template => "places/show"
  end
  
  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    # redirect user
    redirect_to "/places"
  end
  
end

class ActivityFinderController < ApplicationController
  def index
    @location = Location.new
    @types = icons.keys
  end
  def result
    @icons = icon_urls
    @location = Location.find(params[:location_id])
    all_attractions = @location.attractions
    @display_attractions = []
    all_attractions.each do |att|
      att.activity_types.each { |typ|
        if params[:display].include?(typ.name)# && !@display_attractions.include?(att)
          @display_attractions << att
        end
        }
    end
  end

end

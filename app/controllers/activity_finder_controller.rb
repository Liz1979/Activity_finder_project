class ActivityFinderController < ApplicationController
  def index
    @location = Location.new
  end
  def result
    @icons = icon_urls
    @location = Location.find(params[:location_id])
    all_attractions = @location.attractions
    @display_attractions = []
    #raise all_attractions.inspect
    all_attractions.each do |att|
      att.activity_types.each { |typ|
        if params[:display].include?(typ.name)# && !@display_attractions.include?(att)
          @display_attractions << att
        end
        }
    end
  end

end

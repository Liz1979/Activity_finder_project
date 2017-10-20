class ActivityFinderController < ApplicationController
  def index
    @location = Location.new
    @sidebar_names = sidebar_names
    @types = icons.keys
  end
  def result
    @pretty_names = sidebar_names.each.map{|k,v| v.invert}.reduce Hash.new, :merge
    @displayed_types = params[:display]
    @icons = icon_urls
    @location = Location.find(params[:location_id])
    all_attractions = @location.attractions
    @display_attractions = []
    all_attractions.each do |att|
      att.activity_types.each { |typ|
        if @displayed_types.include?(typ.name)# && !@display_attractions.include?(att)
          @display_attractions << att
        end
        }
    end
  end
end

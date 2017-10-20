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

  private
  def sidebar_names
    {
      "Family Friendly":{
        "Amusement Park": "amusement_park",
        "Aquarium": "aquarium",
        "Art Gallery": "art_gallery",
        "Bowling Alley": "bowling_alley",
        "Cinema": "cinema",
        "Zoo": "zoo",
      },
      "Day Attractions":{
        "Museum": "museum",
        "Shopping Centre": "shopping_mall",
        "Stadium": "stadium",
        "Book Shop": "book_store",
        "Beauty Salon": "beauty_salon",
        "Spa": "spa",
        "Town Hall": "city_hall",
        "Embassy": "embassy",
      },
      "Places of Worship":{
        "Church": "church",
        "Hindu Temple": "hindu_temple",
        "Mosque": "mosque",
        "Synagogue": "synagogue",
        "Other": "place_of_worship",
      },
      "Night Life":{
        "Bar": "bar",
        "Casino": "casino",
        "Night Club": "night_club",
      },
      "Food":{
        "Restaurant": "restaurant",
        "Takeaway": "meal_takeaway",
        "Delivery": "meal_delivery",
      },
    }
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
  def icons
    {
      'amusement_park' => "purple_MarkerP",
      'aquarium' => "purple_MarkerQ",
      'art_gallery' => "purple_MarkerA",
      'beauty_salon'=>"pink_MarkerB",
      'bar'=>"red_MarkerB",
      'book_store'=>"pink_MarkerO",
      'bowling_alley' => "purple_MarkerB",
      'casino'=>"red_MarkerC",
      'church'=>"yellow_MarkerC",
      'city_hall'=>"pink_MarkerT",
      'embassy'=>"pink_MarkerE",
      'hindu_temple'=>"yellow_MarkerH",
      'meal_delivery' =>"orange_MarkerD",
      'meal_takeaway' => "orange_MarkerT",
      'mosque'=>"yellow_MarkerM",
      'movie_theater' =>"purple_MarkerC",
      'museum' =>"pink_MarkerM",
      'night_club'=>"red_MarkerN",
      'place_of_worship'=>"yellow_MarkerO",
      'restaurant'=>"orange_MarkerR",
      'shopping_mall'=>"pink_MarkerC",
      'spa'=>"pink_MarkerP",
      'stadium'=>"pink_MarkerS",
      'synagogue'=> "yellow_MarkerS",
      'zoo' => "purple_MarkerZ",
    }
  end
  def icon_urls
    urls = Hash.new("markers/blue_MarkerZ.png")
    icons.each{|k,v|
      urls[k] = "markers/#{v}.png"
    }
    urls
  end
end

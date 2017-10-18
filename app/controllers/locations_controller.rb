class LocationsController < ApplicationController
    before_action :location, only: [:show, :update, :edit, :destroy]
        # GET  Location
        # GET  location.json
        def index
           @locations = Location.all
           Location.paginate(:page => params[:page], :per_page => 10)
           
        end

        # GET  location/1
        # GET  location/1.json
        def show

        end

        # GET  location/new
        def new
            @location = Location.new
        end

        # GET  location/1/edit
        def edit

        end

        # POST  location
        # POST  location.json
        def create
          @location = Location.new  (location_params)
          if @location.geocode
            if Location.exists?(address: @location.address)
              @foundloc = Location.find_by_address(@location.address)
              if type_params.empty?
                find_nearby_api(@foundloc, 5)
                redirect_to @foundloc
              else
                redirect_to result_path(location_id: @foundloc.id, display: type_params)
              end
            else
              if @location.save
                if type_params.empty?
                  find_nearby_api(@location, 5)
                  redirect_to @location, notice: 'Location was successfully created.'
                else
                  find_nearby_api(@location, 5, type_params)
                  redirect_to result_path(location_id: @location.id, display: type_params)
                end
              else
                render :new
              end
            end
          else
            redirect_to root_path
          end
        end

        # PATCH/PUT  location/1
        # PATCH/PUT  location/1.json

        def update
          respond_to do |format|
            if  @location.update  (location_params)
              format.html { redirect_to  @location, notice:  'Location was successfully updated.' }
              format.json { render :show, status: :ok, location: @location }
            else
              format.html { render :edit }
              format.json { render json: @location.errors, status: :unprocessable_entity }
            end
          end
        end

        # DELETE  location/1
        # DELETE  location/1.json
        def destroy
          @location.destroy
          respond_to do |format|
            format.html { redirect_to locations_url, notice:   'Location was successfully destroyed.' }
            format.json { head :no_content }
          end
        end

        def find_nearby_api(location, radius_in_miles, search = search_types)
          @client ||= GooglePlaces::Client.new(Rails.application.secrets.api_key)
          new_attractions = @client.spots(location.latitude,location.longitude, :radius => radius_in_miles * 1600, :types => search)
          new_attractions.each do |att|
            unless Attraction.exists?(place_id: att.id)
              new_params = {name: att.name, longitude: att.lng, latitude: att.lat, place_id: att.id}
              new_att = location.attractions.create!(new_params)
              att.types.each do |type|
                if ActivityType.exists?(name: type)
                  new_type = ActivityType.find_by(name: type)
                elsif search_types.include?(type)
                  new_type = ActivityType.create!(name: type)
                end
                if new_type
                  new_type.attractions << new_att
                  new_type.save!
                end
              end
              new_att.save!
            else
              location.attractions << Attraction.find_by_place_id(att.id)
            end
          end
          location.save!
        end


        private

          def search_types
            [
              'amusement_park',
              'aquarium',
              'art_gallery',
              'beauty_salon',
              'bar',
              'book_store',
              'bowling_alley',
              'casino',
              'church',
              'city_hall',
              'embassy',
              'hindu_temple',
              'meal_delivery',
              'meal_takeout',
              'mosque',
              'movie_theater',
              'museum',
              'night_club',
              'place_of_worship',
              'restaurant',
              'shopping_mall',
              'spa',
              'stadium',
              'synagogue',
              'zoo',
            ]
          end

          # Use callbacks to share common setup or constraints between actions.s
          def location
            @location = Location.find(params[:id])
          end

          # Never trust parameters from the scary internet, only allow the white list through.
          def location_params
            params.require(:location).permit(:name,:search)
          end

          def type_params
            if params.include?(:activity_types)
              params[:activity_types][:types]
            else
              []
            end
          end
      end

class LocationsController < ApplicationController
    before_action :location, only: [:show, :update, :edit, :destroy]
    before_action :google_places_client, only: :find_nearby_api
        # GET  Location
        # GET  location.json
        def index
           @locations = Location.all
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
          respond_to do |format|
            if  @location.geocode && @location.save
              find_nearby_api(@location, 5)
              format.html { redirect_to @location, notice:   'Location was successfully created.' }
              format.json { render :show, status: :created, location:   @location }
            else
              format.html { render :new }
              format.json { render json: @location.errors, status: :unprocessable_entity }
            end
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

        def find_nearby_api(location, radius_in_miles)
          @client ||= GooglePlaces::Client.new("AIzaSyAADeuCERgTEmX8l7AXmQVKO_HfQkyhQ9s")
          new_attractions = @client.spots(location.latitude,location.longitude, :radius => radius_in_miles * 1600)
          new_attractions.each do |att|

            if Attraction.where(place_id: att.id).blank?
              if ActivityType.where(name: att.types[0]).blank?
                new_type = ActivityType.create!(name: att.types[0])
              else
                new_type = ActivityType.where(name: att.types[0])
              end
              new_loc = location.attractions.create!(name: att.name, longitude: att.lng, latitude: att.lat, place_id: att.id, activity_type: new_type[0])
            else
              location.attractions << Attraction.where(place_id: att.id)
            end
          end
          location.save
        end


        private

          def google_places_client
            @client ||= GooglePlaces::Client.new(Geocoder.config.api_key)
          end
          # Use callbacks to share common setup or constraints between actions.s
          def location
            @location = Location.find(params[:id])
          end

          # Never trust parameters from the scary internet, only allow the white list through.
          def location_params
            params.require(:location).permit(:name,:search)
          end
      end

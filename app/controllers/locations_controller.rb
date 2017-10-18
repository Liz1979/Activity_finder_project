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
          @client ||= GooglePlaces::Client.new(Rails.application.secrets.api_key)
          new_attractions = @client.spots(location.latitude,location.longitude, :radius => radius_in_miles * 1600)
          new_attractions.each do |att|
            if !Attraction.exists?(place_id: att.id)
              new_loc = {name: att.name, longitude: att.lng, latitude: att.lat, place_id: att.id}
              location.attractions.build(new_loc)
              att.types.each do |type|
                if !ActivityType.exists?(name: type)
                  new_type = ActivityType.create!(name: type)
                else
                  new_type = ActivityType.find_by_name(type)
                end
                new_type.attractions.build(new_loc)
                new_type.save!
              end
            else
              location.attractions << Attraction.find_by_place_id(att.id)
            end
          end
          location.save!
        end


        private

          # Use callbacks to share common setup or constraints between actions.s
          def location
            @location = Location.find(params[:id])
          end

          # Never trust parameters from the scary internet, only allow the white list through.
          def location_params
            params.require(:location).permit(:name,:search)
          end
      end

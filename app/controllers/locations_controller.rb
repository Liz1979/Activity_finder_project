class LocationsController < ApplicationController
    before_action :location, only: [:show, :update, :edit, :destroy]
    
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
            if  @location.save
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
           location.destroy
          respond_to do |format|
            format.html { redirect_to location_url, notice:   'Location was successfully destroyed.' }
            format.json { head :no_content }
          end
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def location
              @location = Location.find(params[:id])
          end
      
          # Never trust parameters from the scary internet, only allow the white list through.
          def location_params
            params.require(:location).permit(:name, :country, :longitude, :latitude)
          end
      end

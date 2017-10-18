class AttractionsController < ApplicationController
  before_action :attraction, only: [:show, :update, :edit, :destroy]

      # GET  attraction
      # GET  attractions.json
      def index
         @attractions = Attraction.all.paginate(:page => params[:page], :per_page => 10)
      end

      # GET  attractions/1
      # GET  attractions/1.json
      def show

      end

      # GET  attractions/new
      def new
          @attraction = Attraction.new
      end

      # GET  attractions/1/edit
      def edit

      end

      # POST  attractions
      # POST  attractions.json
      def create
          @attraction = Attraction.new  (attraction_params)

        respond_to do |format|
          if  @attraction.save
            format.html { redirect_to @attraction, notice:   'attraction was successfully created.' }
            format.json { render :show, status: :created, location:   @attraction }
          else
            format.html { render :new }
            format.json { render json: @attraction.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT  attractions/1
      # PATCH/PUT  attractions/1.json
      def update
        respond_to do |format|
          if  @attraction.update  (attraction_params)
            format.html { redirect_to  @attraction, notice:  'attraction was successfully updated.' }
            format.json { render :show, status: :ok, location: @attraction }
          else
            format.html { render :edit }
            format.json { render json: @attraction.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE  attractions/1
      # DELETE  attractions/1.json
      def destroy
        @attraction.destroy
        respond_to do |format|
          format.html { redirect_to attractions_url, notice:   'attraction was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def attraction
            @attraction = Attraction.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def attraction_params
          params.require(:attraction).permit(:name, :longitude, :latitude, :speciality)
        end
    end

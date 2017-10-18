class ActivityTypesController < ApplicationController
  before_action :activity_type, only: [:show, :update, :edit, :destroy]

    # GET  activity_types
    # GET  activity_types.json
    def index
      @activity_types = ActivityType.all
      ActivityType.paginate(:page => params[:page], :per_page => 30)
    end
  
    # GET  activity_types/1
    # GET  activity_types/1.json
    def show

    end
  
    # GET  activity_types/new
    def new
       @activity_type = ActivityType.new
    end
  
    # GET  activity_types/1/edit
    def edit

    end
  
    # POST  activity_types
    # POST  activity_types.json
    def create
       @activity_type = ActivityType.new (activity_type_params)
  
      respond_to do |format|
        if  @activity_type.save
          format.html { redirect_to  @activity_type, notice:  'activity_type was successfully created.' }
          format.json { render :show, status: :created, location:  @activity_type }
        else
          format.html { render :new }
          format.json { render json:  @activity_type.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT  activity_types/1
    # PATCH/PUT  activity_types/1.json
    def update
      respond_to do |format|
        if  @activity_type.update (activity_type_params)
          format.html { redirect_to  @activity_type, notice:  'activity_type was successfully updated.' }
          format.json { render :show, status: :ok, location:  @activity_type }
        else
          format.html { render :edit }
          format.json { render json:  @activity_type.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE  activity_types/1
    # DELETE  activity_types/1.json
    def destroy
       activity_type.destroy
      respond_to do |format|
        format.html { redirect_to activity_types_url, notice:  'activity_type was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def activity_type
         @activity_type = ActivityType.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def activity_type_params
        params.require(:activity_type).permit(:name)
      end
  end

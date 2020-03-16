class WatersController < ApplicationController
    def show
    end

    def index 
        if logged_in?
            #@waters = Water.all
            @user = current_user
            @waters = @user.water
        else
            flash.now[:success] = "Reading submitted"
            redirect_to root_path
            flash.now[:danger] = "Must be logged in to access data"
        end
    
    end

    # GET /waters/new
    def new
        @waters = Water.new
    end

     # POST /waters

    def create
        @waters = Water.new(water_params)
        if @waters.save
            
            render 'new'
        else
            render 'new'
        end
    end

        private

        def water_params
            params.require(:water).permit(:usage, :sampled_at, :user_id)
        end
end

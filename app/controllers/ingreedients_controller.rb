class IngreedientsController < ApplicationController
    before_action :set_ingreedient, only: [:edit, :update, :show]
    before_action :require_admin, except: [:show, :index]
    
    def new
        @ingreedient = Ingreedient.new
        

    end

    def create
        @ingreedient = Ingreedient.new(ingreedient_params)
        if @ingreedient.save
            flash[:success] = "ingredient was created successfully"
            redirect_to ingreedient_path(@ingreedient)
        else
            'new'
        end
    end

    def edit
    end

    def update
        if @ingreedient.update(ingreedient_params)
            flash[:success] = "ingredient was updated successfuly"
            redirect_to @ingreedient
        else
            render 'edit'
        end
    end

    def show
        @ingreedient_recipes = @ingreedient.recipes.paginate(page: params[:page], per_page: 5) 

    end
    
    def index
        @ingreedients = Ingreedient.paginate(page: params[:page], per_page: 5)
    end

    private

    def ingreedient_params
        params.require(:ingreedient).permit(:name)
    end

    def set_ingreedient
        @ingreedient = Ingreedient.find(params[:id])
    end

    def require_admin
        if !logged_in? || ( logged_in? and !current_chef.admin)
            flash[:danger] = "Only admin users can perform that action"
            redirect_to ingreedients_path
        end

    end
end

class UsersController < ApplicationController
    before_action :authorize!, only: [:index, :show]
    before_action :find_user, only: [:show, :edit, :destroy, :update]

    
    def index 
        @users = User.all
    end 

    def new 
        @user = User.new
    end 
    
    def create
        user = User.create(user_params)
        if user.valid?
           user.save
           session[:user_id] = user.id
           redirect_to user_path(user)
        else
           flash[:errors] = user.errors.full_messages
           redirect_to new_user_path
        end 

    end 
    
    def edit
    end 

    def destroy
        @user.destroy
        redirect_to users_path
    end 

    def update
        if @user.update(user_params)
            redirect_to user_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end 
    end 

    def show 
        if id_matches_current_user?(params[:id])
            @user = User.find_by(id: params[:id])

            render :show
        else
            flash[:notice] = "Sorry, you are not authorized to view this page "
            redirect_to user_path(session[:user_id])
        end

    end   

    private 
    
    def user_params
        params.require(:user).permit(
            :email, :username, :password, :password_confirmation,
            posts_attributes: [
                :title,
                :image_url,
                :user_id,
                :tag_ids
            ]
        )
    end 
    
    def find_user
        @user = User.find(params[:id])
    end 
end

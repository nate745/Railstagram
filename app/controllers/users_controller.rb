class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :destroy, :update]
    
    def index 
        @users = User.all
    end 

    def new 
    end 
    
    def create 
        @user = User.new(params_user)
        if @user.valid?
            @user.save
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
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
        if @user.update(params_user)
            redirect_to users_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end 
    end 

    def show 
    end    

    private 
    
    def params_user
        params.require(:user).permit(:email, :username, :password)
    end 
    
    def find_user
        @user = User.find(params[:id])
    end 
end

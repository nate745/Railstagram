class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :destroy, :update]

    
    def index 
        @users = User.all
    end 

    def new 
    end 
    
    def create
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'welcome', action: 'home'
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
    
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end 
    
    def find_user
        @user = User.find(params[:id])
    end 
end

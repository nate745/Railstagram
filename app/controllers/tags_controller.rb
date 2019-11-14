class TagsController < ApplicationController

    before_action :find_tag, only: [:edit, :update, :destroy, :show]

    def index
        @tags = Tag.all
    end

    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tag_params)
        if @tag.valid?
            @tag.save
            redirect_to tags_path
        else
            redirect_to tags_path
        end
    end

    def edit
    end

    def update
        if @tag.update(tag_params)
            redirect_to tags_path
        else
            redirect_to edit_tag_path(@tag)
        end
    end


    def show
        @tag = Tag.find(params[:id])
    end

    def destroy
        @tag.delete
        redirect_to tags_path
    end

    private
     
    def tag_params
        params.require(:tag).permit(:name)
    end

    def find_tag
        @tag = Tag.find(params[:id])
    end
end

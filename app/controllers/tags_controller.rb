class TagsController < ApplicationController

    def index
        @tags = Tag.all
    end

    def show
        redirect_to count_tag_path
    end

    # private
     
    # def tag_params
    #     params.require(:tag).permit(:name)
    # end
end

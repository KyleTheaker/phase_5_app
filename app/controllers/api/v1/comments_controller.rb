class CommentsController < ApplicationController
    def index
            @comments = Comment.all
            render json: @comment
        else 
            render json: @comment.errors
        end
    end

    def new
        @comment = Comment.new
    end

    def edit 

    end

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save 
         render json: @comment
        else
          render json: @comment.errors
        end
    end

    def update 

    end

    def destroy
        @comment.destroy 
        render json: { notice: "Your comment has been deleted."}
    end

private

    def set_comment 
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.permit()
    end
end

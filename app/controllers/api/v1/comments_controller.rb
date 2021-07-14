class CommentsController < ApplicationController
    def index
            @comments = Comment.all
            render json: @comment
        else 
            render json: @comment.errors
        end
    end

    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment 
    end

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save 
         render json: @comment
        else
          render json: @comment.errors
        end
    end

    def destroy
        comment =  Comment.find(params[:id])
        comment.likes.destroy_all
        comment.destroy
        render json: { notice: "Your comment has been deleted."}
    end

private

    def set_comment 
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:body, :user_id, :post_id)
    end
end

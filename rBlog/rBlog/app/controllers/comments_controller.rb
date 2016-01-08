class CommentsController < ApplicationController

def create
    @comment = Comment.new(params[:comment])
 
  end
 
  def destroy
#    @comment = Comment.find(params[:id])
 
   @post = Post.find(params[:post_id])
   @comment = @post.comments.create(comment_params)
   @comment.destroy
 
    redirect_to(@comment.post)
  end



  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@comment.post)
    end

  #  redirect_to post_path(@post)
  end


  private def comment_params
    params.require(:comment).permit(:name, :email, :body, :post_id)
  end
end

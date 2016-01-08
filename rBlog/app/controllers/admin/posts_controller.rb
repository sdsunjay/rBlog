class Admin::PostsController < Admin::ApplicationController
  def new
    @page_title = 'Add Post'
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
 
# set image to nil if we haven't chosen an image
   if params[:post][:image].blank?
    @post.image = nil
   end 

# save the post
    if @post.save
        flash[:notice] = "Post Created"
        redirect_to admin_posts_path
    else
        render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      
    if params[:post][:image].blank?
      @post.image = nil
    end 
    if @post.update(post_params)
          flash[:notice] = "Post Updated"
          redirect_to admin_posts_path
    else
          flash[:alert] = "Post Not Updated"
          render :action => 'edit'
      end
  end

  def destroy
      @post = Post.find(params[:id])

    if  @post.destroy
        flash[:notice] = "Post Removed"
        redirect_to admin_posts_path
    else
        render 'destroy'
    end
  end

  def index
      if params[:search]
        @posts = Post.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])  
      else
        @posts = Post.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
      end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :image, :body)
  end
end

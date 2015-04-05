class CommentsController < ApplicationController
  
  def index
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    authorize @comment
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic, @post] 
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end

  def show
  end

  def edit
  end
end

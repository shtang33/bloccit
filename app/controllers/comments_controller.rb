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
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post] 
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end


  def show
  end

  def edit
  end



  def comment_params
    params.require(:comment).permit(:body)
  end


end

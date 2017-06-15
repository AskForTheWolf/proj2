class CommentsControllerController < ApplicationController
  def new
  @recipe = Recipe.find(params[:recipe_id])
  @comment = Comment.new
end
def create
  @recipe = Recipe.find(params[:recipe_id])
  @comment = @recipe.comments.create(comment_params)
  redirect_to recipe_path(@recipe)
end
def edit
  @recipe = Recipe.find(params[:recipe_id])
  @comment = Comment.find(params[:id])
end
def update
  @recipe = Recipe.find(params[:recipe_id])
  @comment = Comment.find(params[:id])
  @comment.update(comment_params)
  redirect_to recipe_path(@recipe)
end
def destroy
  @recipe = Recipe.find(params[:recipe_id])
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to recipe_path(@recipe)
end
private
def comment_params
  params.require(:comment).permit(:body)
end
end

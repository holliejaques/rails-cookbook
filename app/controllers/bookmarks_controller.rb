class BookmarksController < ApplicationController
  before_action :set_category, only: [:new, :create]

  def new
    @bookmark = Bookmark.new # empty instance of bookmark
  end

  def create
  @bookmark = Bookmark.new(bookmark_params)
  # find the right category through the set_category method
  @bookmark.category = @category # @category passes an instance of category, I use line 10 to set the value of category
    if @bookmark.save
      redirect_to category_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to category_path(@bookmark.category), status: :see_other # we give this method a category instance, because bookmark belongs to a category it's .category
  end

  private

  # get the category we are trying to add the new bookmark to
  def set_category
    @category = Category.find(params[:category_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :recipe_id)
  end

end

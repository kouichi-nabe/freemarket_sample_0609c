class CategoriesController < ApplicationController

  def child
    @child_categories = ChildCategory.where(categories_id: params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def grand
    @grand_child_categories = GrandChildCategory.where(child_categories_id: params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
end

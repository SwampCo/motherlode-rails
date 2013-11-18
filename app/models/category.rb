class Category < ActiveRecord::Base
  has_many :nuggets
  include ActsAsTree

  acts_as_tree order: 'name'

  def published_nuggets
    Nugget.where(category_id: @category.id, published: true)
  end

  def unpublished_nuggets
    Nugget.where(category_id: @category.id, published: false)
  end

  def all_nuggets
    Nugget.where(category_id: @category.id)
  end
end

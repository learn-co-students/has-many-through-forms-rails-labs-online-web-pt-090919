class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, :comments

  def categories_attributes=(attr)
    attr.each do |index, cat_data|
      category = Category.find_or_create_by(name: cat_data[:name])
      self.categories << category if category.valid?
    end
  end

  def saved_comments
    self.comments.reject{ |c| !c.persisted?}
  end

  def commentors
    self.comments.map { |comment| comment.user }.uniq.reject { |user| user.username.nil? }
  end
end

class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, reject_if: :all_blank

  def all_cats
    self.categories.map { |cat|
      cat.name
    }.join(", ")
  end

  def all_users
    self.users.map { |cat|
      cat.username
    }.join(", ")
  end

  # def categories_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_or_create_by(category_attribute)
  #     self.categories << category
  #   end
  # end

end

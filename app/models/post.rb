class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories
    # build our own writer instead

  def categories_attributes=(category_attributes)
    # {"0"=>{"name"=>"new category"}}
    category_attributes.values.each do |category_attribute|
      # DO NOT CREATE A CATEGORY IF IT DOESN'T HAVE NAME 
      if category_attribute[:name].present?
        # ALSO DON'T ADD CATEGORY TO POST IF IT ALREADY HAS IT
        category = Category.find_or_create_by(name: category_attribute[:name])
        if !self.categories.include?(category)
          # Insufficient because this returns all categories:
          # self.categories << category
          # instantiating instance of join model - already associated to post and passing in category 
          self.post_categories.build(:category => category)
        end
      end
    end
  end
end

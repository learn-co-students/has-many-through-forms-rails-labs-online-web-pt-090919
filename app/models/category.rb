class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories
  validates :name, presence: true

  accepts_nested_attributes_for :user, reject_if: ->(user_data){ user_data[:username].blank? }

  def username
    self.user.username if not self.user.nil?
  end
end

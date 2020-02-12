class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :name, presence: true

  accepts_nested_attributes_for :user, reject_if: ->(user_data){ user_data[:username].blank? }

  def username
    self.user.username if not self.user.nil?
  end

end

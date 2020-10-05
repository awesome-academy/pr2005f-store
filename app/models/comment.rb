class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :sub_comments, dependent: :destroy
   paginates_per 20
  acts_as_tree order: "created_at DESC"
  validates :content, presence: true
 
end

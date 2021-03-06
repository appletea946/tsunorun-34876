class Group < ApplicationRecord
  belongs_to :user
  has_many :tag_group_relation, dependent: :destroy
  has_many :tags, through: :tag_group_relation
  has_many :comments, dependent: :destroy
  has_many :user_group_relations, dependent: :destroy
  has_many :users, through: :user_group_relations


  # with_options presence: true do
  #   validates :title
  #   validates :details
  #   validates :start_date
  #   validates :end_date
  #   validates :deadline_date
  #   validates :max_num_of_people
  # end
end

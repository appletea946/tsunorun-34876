class Tag < ApplicationRecord
  has_many :tag_group_relation, dependent: :destroy
  has_many :group, through: :tag_group_relation

  validates :name, presence: true, uniqueness: true
end

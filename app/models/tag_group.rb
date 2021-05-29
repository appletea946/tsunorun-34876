class TagGroup
  include ActiveModel::Model
  attr_accessor :tag_ids, :user_id, :title, :details, :start_date, :end_date, :deadline_date, :max_num_of_people

  with_options presence: true do
    validates :user_id
    validates :title
    validates :details
    validates :start_date
    validates :end_date
    validates :deadline_date
    validates :max_num_of_people
  end

  def save
    group = Group.create(title: title, details: details, start_date: start_date, end_date: end_date, deadline_date: deadline_date, max_num_of_people: max_num_of_people, user_id: user_id)
    UserGroupRelation.create(user_id: user_id, group_id: group.id)
    tag_ids.each do |id|
      if id != ""
        TagGroupRelation.create(tag_id: id, group_id: group.id)
      end
    end
  end

end
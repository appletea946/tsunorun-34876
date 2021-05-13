class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string     :title            , null: false
      t.text       :details          , null: false
      t.datetime   :start_date       , null: false
      t.datetime   :end_date         , null: false
      t.datetime   :deadline_date    , null: false
      t.integer    :max_num_of_people, null: false
      t.references :user             , null: false, foreign_key: true

      t.timestamps
    end
  end
end

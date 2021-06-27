class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.string     :name,        null: false
      t.integer    :area_id,     null: false
      t.date       :hiking_date, null: false
      t.string     :time
      t.string     :route_name
      t.text       :route_detail
      t.text       :comment
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end

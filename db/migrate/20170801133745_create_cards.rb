class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.integer :event_id
      t.string  :name
      t.integer :age
      t.string  :job
      t.string  :industry
      t.string  :tag_1
      t.string  :tag_2
      t.string  :tag_3
      t.string  :profile_1
      t.string  :profile_2
      t.string  :profile_3
      t.string  :state

      t.timestamps
    end
  end
end

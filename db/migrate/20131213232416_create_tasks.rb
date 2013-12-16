class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.datetime :due_at
      t.datetime :completed_at
      t.string :priority

      t.timestamps
    end
  end
end

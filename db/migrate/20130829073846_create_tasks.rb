class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id, :null => false
      t.string :title, :null => false
      t.text :body
      t.integer :priority, :null => false
      t.float :hours_effort, :null => false, :precision => 3, :scale => 1
      t.date :start_date
      t.date :due_date, :null => false
      t.float :urgency

      t.timestamps
    end
  end
end

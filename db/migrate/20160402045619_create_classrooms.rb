class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.datetime :entry_at
      t.references :student, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end

class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :user_id, index: true
      t.integer :event_id, index: true
    end
  end
end

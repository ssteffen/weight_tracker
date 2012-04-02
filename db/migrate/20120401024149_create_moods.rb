class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer :mood

      t.timestamps
    end
  end
end

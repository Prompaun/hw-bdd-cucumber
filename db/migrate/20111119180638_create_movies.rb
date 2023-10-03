class CreateMovies < ActiveRecord::Migration[5.2]


  def up
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.text :description
      t.date :release_datetime
      #t.datetime :release_datetime
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  add_index :movies, [:title], unique: true

  def down
    drop_table :movies
  end
end

class CreateGuestEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :guest_episodes do |t|
      t.integer :guest_id, foreign_key: true
      t.integer :episode_id, foreign_key: true
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.bigint :discord_id, index: true
      t.string :discord_username

      t.timestamps
    end
  end
end

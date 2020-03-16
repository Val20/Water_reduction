class CreateWaters < ActiveRecord::Migration[5.2]
  def change
    create_table :waters do |t|
      t.float :usage
      t.datetime :sampled_at
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :waters, [:user_id, :created_at]
  end
end

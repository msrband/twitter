class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end

    add_column :posts, :user_id, :integer, null: false
  end
end

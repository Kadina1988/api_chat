class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :chats do |t|
      t.timestamps
      t.references :chats, :sender, null: false, foreign_key: { to_table: :users }
      t.references :chats, :receiver, null: false, foreign_key: { to_table: :users }
    end
  end
end

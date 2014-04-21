class AddContactIdAndMessageId < ActiveRecord::Migration
  def change
    add_column :messages, :contact_id, :int
  end
end

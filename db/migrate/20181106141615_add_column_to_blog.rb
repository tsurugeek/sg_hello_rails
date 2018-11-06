class AddColumnToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :status, :string
    add_index :blogs, :status
  end
end

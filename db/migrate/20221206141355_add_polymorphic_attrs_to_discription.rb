class AddPolymorphicAttrsToDiscription < ActiveRecord::Migration[7.0]
  def change
    add_column :discriptions, :discriptionable_type, :string
    add_column :discriptions, :discriptionable_id, :integer
  end
end

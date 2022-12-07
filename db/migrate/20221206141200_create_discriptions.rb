class CreateDiscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :discriptions do |t|
      t.text :detail

      t.timestamps
    end
  end
end

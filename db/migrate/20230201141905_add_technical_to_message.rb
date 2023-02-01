class AddTechnicalToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :technical, :boolean, null: false, default: false
  end
end

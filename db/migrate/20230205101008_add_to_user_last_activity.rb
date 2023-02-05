class AddToUserLastActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_activity, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

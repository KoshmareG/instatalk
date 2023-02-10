class RemoveLastActivityFromUsers < ActiveRecord::Migration[7.0]
  def change
    def change
      remove_column :users, :last_activity
    end
  end
end

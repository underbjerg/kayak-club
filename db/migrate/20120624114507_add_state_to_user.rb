class AddStateToUser < ActiveRecord::Migration
  def change
    add_column :users, :state, :string, :default => "new"
  end
end

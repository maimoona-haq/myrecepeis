class ChangeCloumnInChefs < ActiveRecord::Migration[5.1]
  def change
    rename_column :chefs, :chefname, :chef_name
    
  end
end

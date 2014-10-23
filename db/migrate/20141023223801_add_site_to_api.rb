class AddSiteToApi < ActiveRecord::Migration
  def change
    add_column :apis, :site, :string
  end
end

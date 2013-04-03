class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |c|
      c.string :url
      c.string :short_url
      c.integer :click_counter, :default => 0
      c.timestamps
    end
  end
end

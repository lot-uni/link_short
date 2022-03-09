class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :url_short
      t.timestamps null: false
    end
  end
end

class CreatePoems < ActiveRecord::Migration[6.0]
  def change
    create_table :poems do |t|
      t.string :title 
      t.string :description
      t.string :content
    end
  end
end

class CreateTextSources < ActiveRecord::Migration[4.2]
  def change
    create_table :text_sources do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.string     :title
      t.string     :main_image
      t.text       :content
      t.timestamps
    end
  end
end

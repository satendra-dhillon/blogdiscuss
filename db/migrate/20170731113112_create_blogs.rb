class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
    	t.string :title
    	t.text :description
    	t.integer :views
      t.string :slug
    	t.belongs_to :category
    	t.belongs_to :blogger


      t.timestamps
    end
      add_index :blogs, :slug, unique: true
  end
end

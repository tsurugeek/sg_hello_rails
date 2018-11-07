class AddBlogLogoToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :blog_logo, :string
  end
end

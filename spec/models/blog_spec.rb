require 'rails_helper'

describe Blog do
  it "titleがあれば有効な状態であること" do
    blog = Blog.new(title: "title")
    expect(blog.valid?).to be_truthy
  end

  it "titleがなければ無効な状態であること" do
    blog = Blog.new()
    expect(blog.valid?).to be_falsey
  end
end

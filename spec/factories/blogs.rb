FactoryBot.define do
  factory :blog, class: "Blog" do
    sequence(:title) { |n| "title#{n}"}
    status {Blog.status.find_value(:active)}

    # 以下のように書いたら、entryという名前で登録されたfactoryメソッドを探しに行き、オブジェクトを作成し、
    # かつ、entry= で設定しようとする。つまり、entryと書いてもダメ。entriesもダメ。has_manyの場合は after(:create){}
    # entry

  end
end

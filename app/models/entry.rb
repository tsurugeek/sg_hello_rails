class Entry < ApplicationRecord
  # Entryに関する業務ロジックはここに追加する。
  # その他、データベース上の他のテーブルとの関係性などもここに追加する。
  belongs_to :blog
  has_many :comments
end

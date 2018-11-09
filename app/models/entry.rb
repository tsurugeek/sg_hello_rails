class Entry < ApplicationRecord
  # Entryに関する業務ロジックはここに追加する。
  # その他、データベース上の他のテーブルとの関係性などもここに追加する。

  #--------------------
  # relation
  #--------------------
  belongs_to :blog
  has_many :comments

  #--------------------
  # validation
  #--------------------

  #--------------------
  # enum
  #--------------------

  #--------------------
  # scope
  #--------------------
  scope :partial_match_with_title, -> (title) { where("entries.title like ?", "%#{title}%") }

end

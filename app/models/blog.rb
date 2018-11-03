class Blog < ApplicationRecord

  #--------------------
  # relation
  #--------------------
  has_many :entries

  #--------------------
  # validation
  #--------------------
  validates :title, presence: true

end

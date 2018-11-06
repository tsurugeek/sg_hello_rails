class Blog < ApplicationRecord

  #--------------------
  # relation
  #--------------------
  has_many :entries

  #--------------------
  # validation
  #--------------------
  validates :title, presence: true

  #--------------------
  # enum
  #--------------------
  enumerize :status, in: [:active, :inactive], predicates: { prefix: true }, scope: true

end

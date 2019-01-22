class LiveHouse < ApplicationRecord
  has_paper_trail
  has_many :reports, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {in: 2..50}
  validates :capacity, presence: true
  validates :prefecture, presence: true
  validates :hp_url, uniqueness: true, length: {maximum: 100}
  validates :address, uniqueness: true, length: {in: 7..12}

end

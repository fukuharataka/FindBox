class LiveHouse < ApplicationRecord
  has_paper_trail
  has_many :reports, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :capacity, presence: true
  validates :prefecture, presence: true
end

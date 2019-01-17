class LiveHouse < ApplicationRecord
  has_paper_trail
  has_many :reports, dependent: :destroy
end

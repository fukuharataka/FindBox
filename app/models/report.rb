class Report < ApplicationRecord
  belongs_to :live_house, dependent: :destroy
end

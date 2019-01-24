class Report < ApplicationRecord
  belongs_to :live_house, dependent: :destroy
  belongs_to :user, dependent: :destroy
end

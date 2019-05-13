class Site < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end

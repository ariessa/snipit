class View < ApplicationRecord
  geocoded_by :address
  belongs_to :link, counter_cache: true
  scope :grouped_by_day, -> { group_by_day(:created_at).count }
end

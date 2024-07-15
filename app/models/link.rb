class Link < ApplicationRecord
    belongs_to :user, optional: true
    has_many :views, dependent: :destroy
    scope :recent_first, -> { order(created_at: :desc) }
    validates :url, presence: true, format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }

    after_save_commit if: :url_previously_changed? do
        MetadataJob.perform_async(to_param)
    end 

    def self.find(id)
        super ShortCode.decode(id)
    end

    def to_param
        ShortCode.encode(id)
    end

    def domain
        URI(url).host rescue URI::InvalidURIError
    end

    def editable_by?(user)
        user_id? && (user_id == user&.id)
    end

    def views_by_date_range(start_date, end_date)
        views.where(created_at: start_date..end_date)
    end
end

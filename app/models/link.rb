class Link < ApplicationRecord
    belongs_to :user, optional: true
    has_many :views, dependent: :destroy
    scope :recent_first, -> { order(created_at: :desc) }
    validates :url, presence: true, format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }
    validate :url_exists

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

    def url_exists
        return unless url.present?
    
        url = URI.parse(self.url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == 'https')
    
        begin
          response = http.head(url.request_uri)
          unless response.code.to_i == 200
            errors.add(:url, "must be reachable (HTTP status #{response.code})")
          end
        rescue StandardError => e
          errors.add(:url, "could not be validated: #{e.message}")
        end
      end
end

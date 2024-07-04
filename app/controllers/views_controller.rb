class ViewsController < ApplicationController
    before_action :set_link

    rescue_from ActiveRecord::RecordNotFound do
        redirect_to root_path, alert: "Missing link!"
    end

    def show
        Rails.logger.info "test: #{request.env['ipinfo'].city}"

        @link.views.create(
            ip: request.ip,
            user_agent: request.user_agent,
            geolocation: format_geolocation(request.env['ipinfo']),
            timestamp: Time.current
        )
        redirect_to @link.url, allow_other_host: true
    end
  
    def format_geolocation(data)
      return "unknown location" unless data
  
      city = data.city
      region = data.region
      country_name = data.country_name
      [city, region, country_name].compact.join(", ")
    end
end
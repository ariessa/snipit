class ViewsController < ApplicationController
    before_action :set_link

    rescue_from ActiveRecord::RecordNotFound do
        redirect_to root_path, alert: "Missing link!"
    end

    def show
        Rails.logger.info "Request.ip: #{request.ip}"
        Rails.logger.info "Request.ip remote: #{request.remote_ip}"
        geolocation_data = geocode_ip(request.remote_ip)

        @link.views.create(
            ip: request.ip,
            user_agent: request.user_agent,
            geolocation: format_geolocation(geolocation_data),
            timestamp: Time.current
        )
        redirect_to @link.url, allow_other_host: true
    end

    def geocode_ip(ip)
      Geocoder.search(ip).first
    rescue => e
      Rails.logger.error "Geocoding API error: #{e.message}"
      nil
    end
  
    def format_geolocation(data)
      return "unknown location" unless data
  
      city = data.city
      state = data.state
      country = data.country
      [city, state, country].compact.join(", ")
    end
end
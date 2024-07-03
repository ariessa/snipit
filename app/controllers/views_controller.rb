class ViewsController < ApplicationController
    before_action :set_link

    rescue_from ActiveRecord::RecordNotFound do
        redirect_to root_path, alert: "Missing link!"
    end

    def show
        geolocation = fetch_geolocation(request.ip)
        @link.views.create(
            ip: request.ip,
            user_agent: request.user_agent,
            geolocation: geolocation,
            timestamp: Time.current
        )
        redirect_to @link.url, allow_other_host: true
    end

    def fetch_geolocation(ip)
        response = HTTParty.get("https://ipinfo.io/#{ip}/json")
        if response.code == 200
          data = JSON.parse(response.body)
          "#{data['city']}, #{data['region']}, #{data['country']}"
        else
          "unknown Location"
        end
      rescue => e
        Rails.logger.error("Error fetching geolocation: #{e.message}")
        "unknown Location"
      end
end
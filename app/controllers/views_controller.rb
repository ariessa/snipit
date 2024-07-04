class ViewsController < ApplicationController
    before_action :set_link

    rescue_from ActiveRecord::RecordNotFound do
        redirect_to root_path, alert: "Missing link!"
    end

    def show
        location_data = Geocoder.search(request.remote_ip).first
        geolocation = "#{location_data.city}, #{location_data.state}, #{location_data.country}"
        @link.views.create(
            ip: request.ip,
            user_agent: request.user_agent,
            geolocation: geolocation,
            timestamp: Time.current
        )
        redirect_to @link.url, allow_other_host: true
    end
end
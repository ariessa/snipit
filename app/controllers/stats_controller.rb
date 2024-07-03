class StatsController < ApplicationController
    def index
      @links = Link.includes(:views).all
      @start_date = 1.month.ago.beginning_of_day
      @end_date = Time.current.end_of_day
    end
  end
  
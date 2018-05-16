class HomeController < ApplicationController
  before_action :require_user

  def show
    unless current_user.member?
      render 'unauthorized' and return
    end
    @start_date = Date.parse('2018-06-07')
    @end_date = Date.parse('2018-09-17')
    @events = Event.all
  end

  private

  def require_user
    if current_user.nil?
      raise NotAuthorized.new('Please login in')
    end
  end
end

class Public::NotificationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @band = @user.band

    # live情報
    @gather_bands = @band.lives

    @notifications = current_user.band.passive_notifications
    .includes(:live).includes(:visitor).includes(:visited).includes(article: :band)
    .where(checked: false).where.not(visitor_id: current_user.band.id).to_a

    current_user.band.passive_notifications.includes(:live).where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end

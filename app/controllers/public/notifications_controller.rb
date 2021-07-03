class Public::NotificationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @band = @user.band

    # live情報
    @gather_bands = @band.lives

    @notifications = current_user.band.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end

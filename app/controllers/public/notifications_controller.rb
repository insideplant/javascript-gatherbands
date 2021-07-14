class Public::NotificationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @band = @user.band
    @article = Article.new

    # live情報
    @gather_bands = @band.lives

    # 未確認の通知を自身が起こしたアクション以外で取得
    @notifications = current_user.band.passive_notifications.
      includes(:live).includes(:visitor).includes(:visited).includes(article: { band: [:user] }).
      where(checked: false).where.not(visitor_id: current_user.band.id).order(created_at: "DESC").to_a

    # 通知を確認後checkedをtrueに変更
    current_user.band.passive_notifications.includes(:live).where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end

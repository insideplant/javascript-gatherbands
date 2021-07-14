class Notification < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :comment, optional: true
  belongs_to :live, optional: true
  belongs_to :live_organization, optional: true

  # 通知機能
  belongs_to :visitor, class_name: 'Band', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'Band', foreign_key: 'visited_id', optional: true
end

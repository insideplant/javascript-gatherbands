class Comment < ApplicationRecord
  belongs_to :band
  belongs_to :article
end

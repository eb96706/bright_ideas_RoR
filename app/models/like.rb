class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  # validates :user_id, uniqueness:{scope: :post_id, message: 'cannot like the same post twice.'}
end

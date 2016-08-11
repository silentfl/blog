class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  enum status: { pending:  0,
                 accepted: 1,
                 decline:  2,
                 removed:  3 }

  scope :accepted, -> { where(status: statuses[:accepted]) }
end

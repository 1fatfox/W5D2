# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :string
#  user_id     :integer          not null
#

class Sub < ApplicationRecord
  validates :title, presence: true

  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :posts

end

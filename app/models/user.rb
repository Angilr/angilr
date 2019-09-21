# frozen_string_literal: true

# Code for users
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :username, :gender, :birthday, presence: true
  validates :username, length: { in: 2..25, allow_blank: true },
                       format: { with: /\A[a-z][a-z0-9_\-\s]*\z/i,
                                 allow_blank: true }
  validate :in_valid_birthday_range

  enum gender: %i[male female not_both]

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def age
    year = ((Date.today.to_s(:number).to_i - birthday.to_s(:number).to_i) /
            10_000.0)
    year.to_i == year ? year + 1 : year.ceil
  end

  private

  def in_valid_birthday_range
    errors.add(:birthday, :not_in_range) unless
      ((Date.today - 90.years)..(Date.today - 1.day)).cover? birthday
  end
end

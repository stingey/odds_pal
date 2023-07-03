# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_favorites, dependent: :destroy
  has_many :sports, through: :user_favorites
  has_many :followed_teams, dependent: :destroy
  has_many :teams, -> { distinct }, through: :followed_teams

  validates :phone_number, presence: true, numericality: true, length: { is: 10 }

  def send_message
    message = all_lines_message
    return if message.blank?

    TwilioApi.new(user: self, message:).send_message
  end

  def all_lines_message
    all_line_messages_grouped_by_sport.map do |sport_title, line_message|
      "#{sport_title}\r\n#{line_message}"
    end.join("\r\n\r\n")
  end

  def all_line_messages_grouped_by_sport
    sports.each_with_object({}) do |sport, hash|
      message = MessageForSport.new(user: self, sport:).message
      next if message.blank?

      hash[sport.title] = message
    end
  end
end

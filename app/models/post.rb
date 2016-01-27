class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates :title, length: {
    presence: true,
    minimum: 1,
    maximum: 200,
    too_short: "must have at least %{count} character",
    too_long: "must have at most %{count} characters"
  }

  # TODO: add a similar validation above to below
  validates :content, presence: true
end

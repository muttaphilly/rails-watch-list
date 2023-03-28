class Movie < ApplicationRecord
  validates :title, :overview, presence: true
  validates :title, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks

  before_destroy :ensure_no_bookmarks

  private

  def ensure_no_bookmarks
    #binding.pry
    if bookmarks.loaded? || bookmarks.exists?
      raise ActiveRecord::InvalidForeignKey.new("Cannot delete a movie that has bookmarks.")
    end
  end
end

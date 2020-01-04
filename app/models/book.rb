class Book < ApplicationRecord

  ALL_GENRES = [
    'Science fiction',
    'Drama',
    'Action and Adventure',
    'Romance',
    'Mystery',
    'Horror',
    'Fantasy',
    'Novel'
  ]

  validates :title, presence: true
  validates :genre, presence: true, inclusion: ALL_GENRES
  validates :publish_date, presence: true
  validates :isbn, isbn: true

  before_save :titleize_record

  def to_hash
    {
      'Book Title' => title,
      'Genre' => genre,
      'ISBN Number' => isbn,
      'Publish Date' => publish_date,
      'Description' => description
    }
  end

  private

  def titleize_record
    self.title = title.strip.split(/\W+/).map { |w| w.capitalize }.reject(&:empty?).join(' ')
  end
end

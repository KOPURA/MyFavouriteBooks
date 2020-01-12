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
  before_save :titleize_author

  def to_hash
    {
      'Book Title' => title,
      'Genre' => genre,
      'Author' => author,
      'ISBN Number' => isbn,
      'Publish Date' => publish_date,
      'Description' => description
    }
  end

  private

    def titleize_record
      self.title = titleize title
    end

    def titleize_author
      self.author = titleize author
    end

    def titleize field
      return nil if !field.present?
      return field.strip.split(/\s+/).map { |w| w.capitalize }.reject(&:empty?).join(' ')
    end
end

default_books = [{
  title: 'A Man Called Ove',
  genre: 'Novel',
  description: 'A grumpy yet loveable man finds his solitary world turned on its head when a boisterous young family moves in next door.',
  isbn: '9781871510560',
  publish_date: '27-Aug-2013'
}, {
  title: 'It',
  genre: 'Horror',
  description: 'It’s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real...',
  isbn: '9780670813025',
  publish_date: '15-Sep-1986'
}, {
  title: 'Day of the Dragon',
  genre: 'Fantasy',
  description: 'A terrifying upheaval among the highest ranks of the world\'s Wizards sends the maverick Mage, Rhonin, on a perilous journey into the Orc  controlled lands of Khaz Modan. What Rhonin uncovers is a vast, far-reaching conspiracy, darker than anything he ever imagined',
  isbn: '9780671041526',
  publish_date: '1-Feb-2001'
}, {
  title: 'The Return of the King',
  genre: 'Fantasy',
  description: 'THE RETURN OF THE KING, which brings to a close the great epic of war and adventure begun in The Fellowship of the Ring and continued in The Two Towers, is the third and final part of J. R. R. Tolkien’s masterpiece, "The Lord of the Rings."',
  isbn: '9780547928197',
  publish_date: '20-Oct-1955'
}, {
  title: 'The Hobbit',
  genre: 'Fantasy',
  description: 'In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort',
  isbn: '9780547928227',
  publish_date: '21-Sep-1937'
}]

default_books.each do |book|
  Book.create!(book)
end
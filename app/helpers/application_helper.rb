module ApplicationHelper
  def back_to_book_link book, *args, **kwargs
    link_text = "Back to '#{book.title}'"
    return link_to link_text, book_path(book), *args, **kwargs
  end
end

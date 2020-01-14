class IsbnValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    validate_presence record, value
    validate_format record, value if should_have_isbn?(record)
  end

  private

    @@isbn_initial_date = Date.parse('1 Jan 1967')

    def should_have_isbn? record
      record.publish_date && record.publish_date > @@isbn_initial_date
    end

    def validate_presence record, value
      if !value.present? && should_have_isbn?(record)
        record.errors[:base] << "ISBN number is required for books published after #{@@isbn_initial_date}"
      end
    end

    def validate_format record, value
      record.errors[:base] << "ISBN '#{value}'' is not a number." if value.present? && value !~ /^[\d]+$/
      record.errors[:base] << "ISBN should have 10 or 13 digits." if ![10, 13].include? value.length
    end
end
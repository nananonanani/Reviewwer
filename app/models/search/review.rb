class Search::Review < Search::Base
  ATTRIBUTES = %i(
    content
  )
  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Review.arel_table
    results = ::Review.all
    results = results.where(contains(t[:content], content))# if content.present?
  end
end

module TodosHelper
  # Options for the index category filter: an "All" entry followed by every
  # available category, with +selected+ marked as the current choice.
  def category_filter_options(selected)
    options_for_select([ [ "All", "" ] ] + Todo::CATEGORIES.map { |category| [ category, category ] }, selected)
  end
end

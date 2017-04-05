module ArchivesHelper

  # Function for output categories for isotope filtering
  def categories_helper(asset)

    @output = ''

    @output << asset.category.name
      # @archive.categories.each do |category|
      #   @output << category.name.concat(' ')
        # @output << category.name.concat(' ')
    # end

    return @output
  end

end

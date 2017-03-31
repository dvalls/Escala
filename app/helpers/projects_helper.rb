module ProjectsHelper

  # Function for output categories for isotope filtering
  def categories_helper(project)

    @output = ''

    project.categories.each do |category|
       @output << category.name.concat(' ')
    end

    return @output
  end

end

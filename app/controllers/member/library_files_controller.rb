class Member::LibraryFileController < Member::MemberAreaController #ApplicationController

  before_action :student_logged?

  # layout 'member'

  def show
    @library_file = LibraryFile.find(params[:id])
    # redirect_to @library_file.url
    # get_page_contents
  end



end

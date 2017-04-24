class Member::MemberAreaController < ApplicationController
  # layout 'views/layouts/application'
  before_action :student_logged?


  helper_method :get_page_contents
  def get_page_contents
    @docs_groups = []
    @page_categories = []
    @content_videos = []
    @page.content_blocks.each do |block|

      case block.contentable_type

        when 'ContentVideoGroup'
          block.contentable.content_videos.each do |video|
            if not video.blank?
              @content_videos << video
            end
          end

        when 'ContentLibraryGroup'
          @page_categories = block.contentable.categories

        when 'ContentDocsGroup'
          @docs_groups = block.contentable.docs
      end
    end
  end
end

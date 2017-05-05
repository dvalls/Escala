class Member::MemberAreaController < ApplicationController
  layout 'member'
  before_action :student_logged?

  helper_method :get_page_contents

  def get_page_contents
    @docs_groups = []
    @page_categories = []
    @content_videos = []
    #Para cada bloco de conteúdo da página
    @page.content_blocks.each do |block|
      case block.contentable_type
        #caso seja bloco de videos
        when 'ContentVideoGroup'
          block.contentable.content_videos.each do |video|
            if not video.blank?
              @content_videos << video
            end
          end
        #case seja bloco de arquivos de biblioteca
        when 'ContentLibraryGroup'
          @page_categories = block.contentable.categories
        #caso seja bloco de documentos e outros arquivos
        when 'ContentDocsGroup'
          @docs_groups = block.contentable.docs
      end
    end
  end
end

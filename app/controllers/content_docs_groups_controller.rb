class ContentDocsGroupsController < ApplicationController
    before_action :admin_logged?
    before_action :get_group, only: [:edit, :update, :destroy]


    def index
      @docs_groups = ContentDocsGroup.all
    end

    def new
      @group = ContentDocsGroup.new
    end

    def create
      @group = ContentDocsGroup.new(group_params)
      if @group.save
        redirect_to docs_path, notice: 'Grupo criado.'
      end
    end

    def edit
    end

    def update
      if @group.update(group_params)
        redirect_to docs_path, notice: 'Grupo atualizado.'
      else
        render :edit
      end
    end

    def destroy
      @group.destroy

      redirect_to docs_path, notice: 'Grupo apagado.'
    end

    private

    def group_params
      params.require(:content_docs_group).permit(:name, :course_id)
    end

    def get_group
      @group = ContentDocsGroup.find(params[:id])
    end

end

class DocsController < ApplicationController
    before_action :set_archive, only: [:edit, :update, :show, :destroy]
    before_filter :user_admin?, only: [:new, :create, :edit, :update]

    def index
      @docs = Doc.all
      @docs_groups = ContentDocsGroup.all

    end

    def show
      redirect_to @doc.url.url
    end

    def new
      @doc = Doc.new()
    end

    def create
      @doc = Doc.new(doc_params)
      @doc.url = params[:doc][:url]
      if @doc.save
        redirect_to docs_path(), notice: 'Documento criado com sucesso'
      else
        flash[:notice] = "#{@doc.errors.full_messages}"
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @doc.update(doc_params)
        redirect_to docs_path(), notice: 'Documento criado com sucesso.'
      else
        flash[:notice] = "#{@doc.errors.full_messages}"
        render action: 'edit'
      end
    end

    def destroy
      @doc.destroy
      redirect_to docs_path(), notice: 'Documento excluído com sucesso.'
    end

    private

    def doc_params
      params.require(:doc).permit(:name, :description, :url)
    end


    def set_archive
      @doc = Doc.find(params[:id])
    end

    def remove_file
      @doc.update_attributes(:remove_file => true)
    end
end

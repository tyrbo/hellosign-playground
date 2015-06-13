class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
  end

  def create
    template = Template.create(template_params)
    
    redirect_to(edit_template_path(template))
  end

  def edit
    @template = Template.find(params[:id])

    if @template.template_id.nil?
      req = Api.new.create_embedded_template_draft("A Title", "A Subject", "A Message")

      @url = req["edit_url"]
      @template.update_column(:template_id, req["template_id"])
    end
  end

  private

  def template_params
    params.require(:template).permit(:title)
  end
end

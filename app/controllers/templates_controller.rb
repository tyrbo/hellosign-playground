class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def new
  end
end

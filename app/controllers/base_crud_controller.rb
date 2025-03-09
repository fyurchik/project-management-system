class BaseCrudController < ApplicationController
  def index
    data = resource_class::List.call(search_params)
    render_json_response(true, data, :ok)
  end

  def show
    data = resource_class::Show.call(resource)
    render_json_response(true, data, :ok)
  end

  def create
    data = resource_class::Create.call(resource_params)
    handle_entity_result(data, :ok)
  end

  def update
    data = resource_class::Update.call(resource, resource_params)
    handle_entity_result(data, :ok)
  end

  def destroy
    data = resource_class::Delete.call(resource)
    handle_entity_result(data, :ok)
  end

  private

  def resource
    @resource = resource_class.find(params[:id])
  end

  def resource_class
    raise NotImplementedError, "Subclasses must implement the 'resource_class' method."
  end

  def resource_params; end

  def search_params; end
end

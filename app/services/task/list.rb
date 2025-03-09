class Task
  class List < BaseListService
    attr_reader :current_user

    def self.call(params)
      new(params).call
    end

    def initialize(params)
      super(params)
    end

    def call
      TaskSerializer.render_as_hash(resource, view: :common)
    end

    def resource
      resource = resource_class.all
      resource = resource.filter_by_status(params[:status]) if params[:status].present?
      resource
    end
  end
end

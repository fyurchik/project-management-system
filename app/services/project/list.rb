class Project
  class List < BaseListService
    attr_reader :resource, :params, :current_user

    def self.call(params, current_user)
      new(params, current_user).call
    end

    def initialize(params, current_user)
      @current_user = current_user

      super(params)
    end

    def call
      ProjectSerializer.render_as_hash(resource, view: :with_tasks)
    end

    def resource
      resource_class.where(user: current_user).includes(:tasks)
    end
  end
end

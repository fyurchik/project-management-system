class Project
  class Create < BaseCreateService
    attr_reader :resource, :params, :current_user

    def self.call(params, current_user)
      new(params, current_user).call
    end

    def initialize(params, current_user)
      @current_user = current_user

      super(params)
    end

    private

    def create_resource
      @resource = resource_class.create(params.merge(user: current_user))
    end
  end
end

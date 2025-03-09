class Project
  class Show < BaseShowService
    def call
      ProjectSerializer.render_as_hash(resource, view: :with_tasks)
    end
  end
end

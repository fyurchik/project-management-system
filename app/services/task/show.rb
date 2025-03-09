class Task
  class Show < BaseShowService
    def call
      TaskSerializer.render_as_hash(resource, view: :common)
    end
  end
end

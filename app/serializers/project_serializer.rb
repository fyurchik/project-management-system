class ProjectSerializer < Blueprinter::Base
  identifier :id

  view :common do
    fields :name, :description
  end

  view :with_tasks do
    include_view :common

    association :tasks, blueprint: TaskSerializer, view: :common
  end
end

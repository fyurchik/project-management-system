class TaskSerializer < Blueprinter::Base
  identifier :id

  view :common do
    fields :title, :description, :status
  end
end

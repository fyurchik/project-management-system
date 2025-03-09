module Api
  module V1
    class TasksController < BaseCrudController
      private

      def resource_class
        Task
      end

      def search_params
        params.permit(:status, :project_id)
      end

      def resource
        resource_class.find_by(id: params[:id], project_id: params[:project_id])
      end

      def resource_params
        params.permit(
          :id,
          :project_id,
          :title,
          :description,
          :status
        )
      end
    end
  end
end

module Api
  module V1
    class ProjectsController < BaseCrudController
      def index
        cache_key = "projects:#{current_user.id}"

        data = Rails.cache.fetch(cache_key, expires_in: 10.seconds) do
          resource_class::List.call(search_params, current_user)
        end
        render_json_response(true, data, :ok)
      end

      def create
        data = resource_class::Create.call(resource_params, current_user)
        handle_entity_result(data, :ok)
      end

      private

      def resource_class
        Project
      end

      def resource
        resource_class.find_by(id: params[:id], user: current_user)
      end

      def resource_params
        params.permit(
          :id,
          :name,
          :description
        )
      end
    end
  end
end

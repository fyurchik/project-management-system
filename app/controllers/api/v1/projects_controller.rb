module Api
  module V1
    class ProjectsController < BaseCrudController
      def index
        cache_key = "projects/index/#{current_user.id}/#{params.to_json}"

        if (cached_data = Rails.cache.read(cache_key))
          render_json_response(true, cached_data, :ok)
        else
          data = resource_class::List.call(search_params, current_user)
          Rails.cache.write(cache_key, data, expires_in: 10.seconds)
          render_json_response(true, data, :ok)
        end
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

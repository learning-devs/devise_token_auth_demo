class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do
    render json: { errors: 'You dont have access.' }, status: :unprocessable_entity
  end

  def pundit_user
      current_api_v1_user
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    end

    def pagination_meta(collection)
      {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }
    end
end

class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    private

    # Model = Class name (i.e. Mission, Planet, Scientist)
    def record_not_found(error)
        render json: { error: "#{error.model} not found" }, status: :not_found
    end

    def invalid_record(invalid)
        render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end

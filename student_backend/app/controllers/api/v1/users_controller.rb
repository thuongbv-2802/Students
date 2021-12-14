module Api::V1
  class UsersController < ApiController
    before_action :set_user, only: %i[ show edit update destroy ]
    skip_before_action :verify_authenticity_token, only: %i[index show edit update destroy create]

    # GET /v1/users
    def index
      @users = User.order('created_at DESC')
      json_response(@users, :ok)
    end

    # GET /users/1 or /users/1.json
    def show
      json_response(@user, :ok)
    end

    # GET /users/new
    def new
      @user = User.new
      json_response(@user, :ok)
    end

    # GET /users/1/edit
    def edit
      json_response(@user, :ok)
    end

    # POST /users or /users.json
    def create
      @user = User.new(user_params)
      if @user.save
        json_response(@user, :created)
      else
        error_response
      end
    end

    # PATCH/PUT /users/1 or /users/1.json
    def update
      if @user.update(user_params)
        json_response(@user, :ok)
      else
        error_response
      end
    end

    # DELETE /users/1 or /users/1.json
    def destroy
      @user.destroy
      json_response(@user, :ok)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by id: params[:id]
      return if @user
      json_response('Not found', :not_found)
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
    def error_response
      json_response(@user.error, :unprocessable_entity)
    end

    def json_response(object, status)
      if status.eql?(:ok) or status.eql?(:created)
        render json: { status: true, data: object.as_json(only: [:id, :name, :email, :created_at, :updated_at])}, status: status
      else
        render json: { status: false, message: object }, status: status
      end
    end

  end
end

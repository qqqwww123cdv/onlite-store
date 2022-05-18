class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Only available for admin!" }
      format.json { render json: {}, status: :unprocessable_entity }
    end
  end
end
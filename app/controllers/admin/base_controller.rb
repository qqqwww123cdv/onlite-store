class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Only available for admin!" }
      format.json { render json: {}, status: :unprocessable_entity }
    end
  end



  rescue_from ActiveRecord::RecordNotUnique do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "You entered incorrect values" }
      format.json { render json: {}, status: :unprocessable_entity }
    end
  end

  rescue_from CSV::MalformedCSVError do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Must be .csv format" }
      format.json { render json: {}, status: :unprocessable_entity }
    end
  end


end
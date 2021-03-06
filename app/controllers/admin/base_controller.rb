class Admin::BaseController < ApplicationController

  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Only available for admin!" }
    end
  end

  rescue_from NoMethodError do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "You have not selected a file" }
    end
  end

  rescue_from ActiveRecord::RecordNotUnique do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "You entered incorrect values" }
    end
  end

  rescue_from CSV::MalformedCSVError do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Must be .csv format" }
    end
  end


end
class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include ApplicationHelper
end

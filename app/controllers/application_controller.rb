class ApplicationController < ActionController::Base
    project_from_forgery with :exception
end

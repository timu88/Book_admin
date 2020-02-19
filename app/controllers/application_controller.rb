class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :detect_mobile_variant

    private
    def detect_mobile_variant
        request.variant = :mobile if request.user_agent =~ /iPhone/
    end
end

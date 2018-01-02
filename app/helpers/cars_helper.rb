module CarsHelper
    def current_car
        @car ||= Car.from_hash(session[:car9527])
    end
end

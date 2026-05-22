require 'json'

class FastCartMiddleware
    def initialize(app)
        @app = app
    end

    def call(env)
        request = Rack::Request.new(env)

        # Intercept on POST requests to our fast endpoint
        if request.post? && request.path == 'fast_cart/add'
            return handle_add_to_cart(request, env)
        end

        # If it's not our specific route, pass it down to Rails normally
        @app.call(env)
    end

    private

    def handle_add_to_cart(request, env)
        # Devise users Warden under the hood. This gets the authenticated user
        user = env['warden']&.user

        unless user
            return [401, { 'Content-Type'=> 'application/json' }, [{ error: 'Unauthorized' }.to_json]]
        end

        event_id = request.params['event_id']

        if event_id
            user.add_to_cart(event_id)
            [200, { 'Content-Type'=> 'application/json' }, [{ success: true, count: user.cart_count }.to_json]]
        else
            [400, { 'Content-Type'=> 'application/json' }, [{ error: 'Missing event_id' }.to_json]]
        end
    end
end
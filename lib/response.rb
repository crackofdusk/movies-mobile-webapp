module Moviesio
  module ResponseHelper

    def respond(view, object)
      respond_to do |r|
        r.html { erb view, :locals => { :model => object } }
        r.json { object.to_json }
      end
    end

  end
end

module ActiveHashRelation
  module Helpers
    def model_class_name(resource, _engine = false)
      _class = resource.class.to_s.split('::')
      if _engine === true
        "#{_class[0]}::#{_class[1]}".constantize
      else
        _class.first.constantize
      end
    end

    def engine_name
      Rails::Engine.subclasses[0].to_s.split('::').first
    end

    def find_model(model)
      return model if model

      model = model_class_name(@resource)
      if model.nil? || engine_name == model.to_s
        model = model_class_name(@resource, true)
      end

      return model
    end
  end
end

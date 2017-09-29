require 'mustache'

module Services
  class Renderer
    def initialize(template, values)
      @view = Mustache.new

      assign(template)
      add(values)
    end

    def call
      @view.render
    end

    private

    def assign(template)
      @view.template = template
    end

    def add(values)
      values.each do |key, value|
        @view[key.to_sym] = value
      end
    end
  end
end


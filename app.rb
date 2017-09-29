require_relative 'source/services/renderer'

template = 'Render changes string and numbers for values: like {{a_string}} and {{a_number}}'
renderer = Services::Renderer.new(template, a_string: 'gaticos', a_number: 5)

p renderer.call()
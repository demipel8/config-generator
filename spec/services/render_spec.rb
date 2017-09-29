require_relative '../../source/services/renderer'

RSpec.describe 'renderer' do
  it 'requires a template and a dictionary' do
    expect { Services::Renderer.new }.to raise_error(ArgumentError)
  end

  it 'returns the template with the placeholders interpolated for its values' do
    template = 'render changes string and numbers for values: like {{a_string}} and {{a_number}}'
    renderer = Services::Renderer.new(template, a_string: 'gatigos', a_number: 5)

    config = renderer.call()

    expect(config).to eq 'render changes string and numbers for values: like gatigos and 5'
  end
end
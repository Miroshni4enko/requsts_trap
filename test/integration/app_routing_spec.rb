require 'rspec'

describe 'routing to app' do

  it 'routes /tests to trap_urls#trap' do
    expect(get: '/tests').to route_to(
      controller: 'trap_urls',
      action: 'trap'
    )
  end
end
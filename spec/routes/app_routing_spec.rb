require 'rails_helper'

RSpec.describe 'routing to trap_urls', type: :routing do
  it 'routes /:url to trap_urls#trap for log_request' do
    expect(get: '/someurl').to route_to(
      controller: 'trap_urls',
      action: 'trap',
      url: 'someurl'
    )
  end
=begin

  it 'does not expose a list of profiles' do
    expect(:get => '/profiles').not_to be_routable
  end
=end
end
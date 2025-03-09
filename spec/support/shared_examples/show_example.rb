RSpec.shared_examples 'show' do
  let!(:sign_in_user)      { create(:user) }
  let(:json_response_data) { JSON.parse(response.body).with_indifferent_access[:data] }
  let(:status)             { :success }
  let(:expected_response)  { nil }

  before { sign_in(sign_in_user) }

  it 'returns list of entities' do
    get :show, params: params

    expect(response).to have_http_status(status)
    expect(json_response_data[:id]).to eql(expected_response) if expected_response
  end
end

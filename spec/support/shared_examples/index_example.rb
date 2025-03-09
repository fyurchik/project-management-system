RSpec.shared_examples 'index' do
  let!(:sign_in_user)      { create(:user) }
  let!(:params)            { {} }
  let(:json_response_data) { JSON.parse(response.body).with_indifferent_access[:data] }
  let(:expected_response)  { nil }

  before { sign_in(sign_in_user) }

  it 'returns list of entities' do
    get :index, params: params

    expect(response).to have_http_status(:success)
    expect(json_response_data.count).to eql(expected_response) if expected_response
  end
end

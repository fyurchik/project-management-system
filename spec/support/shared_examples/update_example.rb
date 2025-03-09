RSpec.shared_examples 'update' do
  let!(:sign_in_user)      { create(:user) }
  let!(:params)            { {} }
  let(:json_response_data) { JSON.parse(response.body).with_indifferent_access[:data] }

  before { sign_in(sign_in_user) }

  it 'uses the given parameter' do
    put :update, params: params

    expect(response).to have_http_status(:success)
  end
end

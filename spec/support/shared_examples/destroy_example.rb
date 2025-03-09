RSpec.shared_examples 'destroy' do
  let!(:sign_in_user)      { create(:user) }
  let!(:params)            { {} }
  let(:json_response_data) { JSON.parse(response.body).with_indifferent_access[:data] }

  before { sign_in(sign_in_user) }

  it 'destroys entity' do
    delete :destroy, params: params

    json_response_data

    expect(response).to have_http_status(:success)
    expect(initial_data.class).not_to exist(initial_data.id)
  end
end

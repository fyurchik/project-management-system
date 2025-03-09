RSpec.shared_examples 'create' do
  let!(:sign_in_user)      { create(:user) }
  let!(:params)            { {} }
  let(:json_response_data) { JSON.parse(response.body).with_indifferent_access[:data] }
  let(:status)             { :success }

  before { sign_in(sign_in_user) }

  it 'creates entity' do
    post :create, params: params

    expect(response).to have_http_status(status)

    expect(json_response_data.slice(*params)).to eql params.with_indifferent_access.slice(*params) if json_response_data
  end
end

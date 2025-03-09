require 'rails_helper'

RSpec.describe Api::V1::ProjectsController, type: :controller do
  describe '#index' do
    it_behaves_like 'index' do
      let!(:initial_data)     { create_list(:project, 2, user: sign_in_user) }
      let(:expected_response) { initial_data.count }
    end
  end

  describe '#show' do
    it_behaves_like 'show' do
      let(:initial_data)      { create :project, user: sign_in_user }
      let(:params)            { { id: initial_data.id } }
      let(:expected_response) { initial_data.id }
    end
  end

  describe '#create' do
    it_behaves_like 'create' do
      let(:params) { { name: 'Project', description: 'Somthing', user: sign_in_user } }
    end
  end

  describe '#update' do
    it_behaves_like 'update' do
      let(:initial_data) { create :project, name: 'Project', description: 'Somthing', user: sign_in_user  }
      let(:params) do
        {
          id: initial_data.id,
          name: "New project",
          description: 'New Description'
        }
      end

      expectations do
        expect(initial_data.reload.name).to eq(params[:name])
        expect(initial_data.reload.description).to eq(params[:description])
      end
    end
  end

  describe '#destroy' do
    it_behaves_like 'destroy' do
      let(:initial_data) { create :project, user: sign_in_user }
      let(:params)       { { id: initial_data.id } }
    end
  end
end

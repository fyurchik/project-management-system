require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :controller do
  let!(:project)     { create :project, user: sign_in_user }

  describe '#index' do
    it_behaves_like 'index' do
      let!(:initial_data)     { create_list(:task, 2, project: project) }
      let(:expected_response) { initial_data.count }
    end
  end

  describe '#show' do
    it_behaves_like 'show' do
      let(:initial_data)      { create :task, project: project }
      let(:params)            { { id: initial_data.id, project_id: project.id } }
      let(:expected_response) { initial_data.id }
    end
  end

  describe '#create' do
    it_behaves_like 'create' do
      let(:params)   { { title: 'Task', description: 'Somthing', project_id: project.id } }
    end
  end

  describe '#update' do
    it_behaves_like 'update' do
      let(:initial_data) { create :task, title: 'Task', description: 'Somthing', project_id: project.id }
      let(:params) do
        {
          id: initial_data.id,
          title: "New task",
          project_id: project.id,
          description: 'New Description',
          status: "in_progress"
        }
      end

      expectations do
        expect(initial_data.reload.title).to eq(params[:title])
        expect(initial_data.reload.description).to eq(params[:description])
        expect(initial_data.reload.status).to eq(params[:status])
      end
    end
  end

  describe '#destroy' do
    it_behaves_like 'destroy' do
      let(:initial_data) { create :task, title: 'Task', description: 'Somthing', project_id: project.id }
      let(:params)       { { id: initial_data.id, project_id: project.id } }
    end
  end
end

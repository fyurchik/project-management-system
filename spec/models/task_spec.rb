require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:project) { create(:project) }
  let(:task) { create(:task, project: project) }

  describe 'associations' do
    it { should belong_to(:project) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(new_task: 0, in_progress: 1, completed: 2) }
  end

  describe 'scopes' do
    let!(:new_task) { create(:task, project: project, status: :new_task) }
    let!(:in_progress_task) { create(:task, project: project, status: :in_progress) }
    let!(:completed_task) { create(:task, project: project, status: :completed) }

    it 'filters tasks by status' do
      expect(Task.filter_by_status(:new_task)).to include(new_task)
      expect(Task.filter_by_status(:new_task)).not_to include(in_progress_task)
      expect(Task.filter_by_status(:new_task)).not_to include(completed_task)
    end
  end
end

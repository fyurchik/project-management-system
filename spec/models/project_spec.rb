require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  describe 'associations' do
    it { should have_many(:tasks).dependent(:destroy) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'dependent destroy' do
    let!(:task) { create(:task, project: project) }

    it 'destroys associated tasks when project is destroyed' do
      expect { project.destroy }.to change { Task.count }.by(-1)
    end
  end
end

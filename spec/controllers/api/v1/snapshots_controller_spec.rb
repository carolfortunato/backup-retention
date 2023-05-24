require 'rails_helper'

RSpec.describe Api::V1::SnapshotsController, type: :controller do
  describe 'GET #should_retain' do
    it 'returns true for a snapshot that should be retained' do
      date = Date.today - 30
      get :should_retain, params: { plan: 'Beginner', date: date }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['retain']).to eq(true)
    end

    it 'returns false for a snapshot that should be deleted' do
      date = Date.today - 60
      get :should_retain, params: { plan: 'Beginner', date: date }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['retain']).to eq(false)
    end
  end
end

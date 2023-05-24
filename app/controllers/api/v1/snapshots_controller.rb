class Api::V1::SnapshotsController < ApplicationController
  def should_retain
    plan = params[:plan]
    date = Date.parse(params[:date])
    retain = BackupManager.should_retain(plan, date)
    render json: { retain: retain }
  end
end

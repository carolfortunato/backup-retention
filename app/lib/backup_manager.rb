class BackupManager
  def self.should_retain(plan, date)
    case plan
    when "Beginner"
      starter_period = 42
      return date >= (Date.today - starter_period)
    when "Pro"
      retention_period = [42, 365]
      last_snapshot_of_month = date.next_month.beginning_of_month - 1.day
      return date >= (Date.today - retention_period.max) || date == last_snapshot_of_month
    when "Ultra"
      retention_period = [42, 365, 7 * 365]
      last_snapshot_of_month = date.next_month.beginning_of_month - 1.day
      last_snapshot_of_year = date.next_year.beginning_of_year - 1.day
      return date >= (Date.today - retention_period.max) || date == last_snapshot_of_month || date == last_snapshot_of_year
    else
      raise "Invalid plan"
    end
  end
end

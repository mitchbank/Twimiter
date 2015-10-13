class ChangeTweetStatDateToForDate < ActiveRecord::Migration
  def change
  	rename_column :tweet_stats, :date, :for_date
  end
end

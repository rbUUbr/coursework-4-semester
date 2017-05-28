namespace :lab_queues do
  desc "Destroy lab queues, that past"
  task remove_past_labs: :environment do
     LabQueue.joins(:schedule).where('date_of_lab < ?', Date.today).destroy_all
  end

end

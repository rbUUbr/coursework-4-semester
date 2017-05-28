namespace :lab_queues do
  desc "Destroy lab queues, that past"
  task remove_past_labs: :environment do
    array_of_labs = []
    LabQueue.all.each do |lab_queue|
      if lab_queue.date < Date.today
        array_of_labs << lab_queue
      end
    end
    array_of_labs.delete_all
  end

end

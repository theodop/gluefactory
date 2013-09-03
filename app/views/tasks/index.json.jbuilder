json.array!(@tasks) do |task|
  json.extract! task, :user_id, :title, :body, :priority, :hours_effort, :start_date, :due_date, :urgency
  json.url task_url(task, format: :json)
end

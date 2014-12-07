module ApplicationHelper
  def filter_params(filter)
    task_return = {
      completed: params[:completed],



    }
  task_return.merge(filter)
  end

end

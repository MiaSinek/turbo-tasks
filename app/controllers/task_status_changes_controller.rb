class TaskStatusChangesController < ApplicationController

  def change_status
    @task = Task.find(params[:id])
    @task.update(status: task_params[:status])
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@task)}_container") }
      format.html { redirect_to tasks_path, notice: "Updated task status." }
    end
  end

  private

  def task_params
    params.require(:task).permit(:status)
  end
end

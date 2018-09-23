class V2::TodosController < ApplicationController
  def index
    @todos = current_user.todos.paginate(page: params[:page], per_page: 20)
    json_response(@todos)
  end
end

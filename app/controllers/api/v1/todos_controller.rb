# frozen_string_literal: true

class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: %i[update destroy]
  def index
    render json: Todo.all.order("created_at DESC")
  end

  def create
    @todo = Todo.create!(todo_params)
    render json: @todo
  end

  def update
    @todo.update!(todo_params)
  end

  def destroy
    @todo.destroy!
  end

  private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:body, :done)
    end
end

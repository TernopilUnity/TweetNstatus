class ToolsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tools = @user.tools
  end

  def show
    @user = User.find(params[:user_id])
    @tool = @user.tools.find(params[:id])
    render json: @tool.to_json(except: [:id, :created_at, :updated_at, :email], include: :User)
  end

  def create
    @tool = Tool.new(params[:post])
    if @tool.save
      render json: @tool, status: :created, location: @tool
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  def fire_Tool
    @tool = Tool.find(params[:id])
    @tool.fire!
    if @tool.low_counts?
      render :fire_and_reload
    end
  end


  def toggle_condition
    @tool = Tool.find(params[:id])
    @tool.toggle_condition
    respond_to do |format|
      format.html { redirect_to @tool, notice: 'Changed condition' }
      format.js
    end
  end
end


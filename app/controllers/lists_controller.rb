class ListsController < ApplicationController
  before_action :find_list, only: [:show, :lists, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def lists
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to lists_path, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path, notice: 'List was successfully destroyed.'
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    if params[:id] == "new"
      @list = List.new
    else
      @list = List.find(params[:id])
    end
  end
end

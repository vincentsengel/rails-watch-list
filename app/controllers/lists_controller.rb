class ListsController < ApplicationController

  before_action :set_list, only: [ :show ]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = Movie.all
    # raise
  end

  private

  def set_list
  end

  def list_params
    params.require(:list).permit(:name)
  end

end

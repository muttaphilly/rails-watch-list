class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  def index
    @lists = List.all
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params[:list])
    @list.save
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

class BoardsController < ApplicationController
  skip_before_action :authorize!, only: [:index, :show]
  before_action :set_target_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @boards = @boards.page(params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    # board = Board.new(board_params)
    # binding.pry
    board = current_user.boards.build(board_params)
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(board_id: @board.id)
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to @board, flash: { notice: "「#{@board.title}」の掲示板が更新されました" }
    else
      redirect_back fallback_location: root_path, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end

  def destroy
    @board.destroy

    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" }
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
end

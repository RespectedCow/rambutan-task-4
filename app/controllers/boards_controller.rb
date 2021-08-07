class BoardsController < ApplicationController
    def new
        @board = Board.new
    end

    def show
        @board = Board.find(params[:id])
    end

    def edit 
        @board = Board.find(params[:id])
    end

    def create
        @board = current_user.boards.build(post_params.merge(user_id: current_user.id))

        respond_to do |format|
            if @board.save
                format.html { redirect_to @board, notice: "Board was successfully created." }
                format.json { render :show, status: :created, location: @board }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @board.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @board.destroy
        respond_to do |format|
          format.html { redirect_to boards_url, notice: "Boards was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    def update
        @board = Board.find(params[:id])

        respond_to do |format|
          if @board.update(post_params)
            format.html { redirect_to @board, notice: "Board was successfully updated." }
            format.json { render :show, status: :ok, location: @board }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @board.errors, status: :unprocessable_entity }
          end
        end
      end

    private
    def set_post
      @board = Board.find(params[:id])
    end

    def post_params
      params.require(:board).permit(:title, :body, :user_id)
    end
end

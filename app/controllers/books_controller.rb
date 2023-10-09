class BooksController < ApplicationController
  def top
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:success] = "successfully created!"
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    # flash[:success] = "Successfully created!"
  end

  def edit
    @book = Book.find(params[:id])
    # if @book.update
    #   redirect_to book_path(@book.id)
    #   flash[:success] = "Successfully edited!"
    # else
    #   @book = Book.fine(params[:id])
    #   render :edit
    #   flash[:fail] = "Edit failed..."
    # end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:success] = "successfully updated!"
    else
      @book = Book.find(params[:id])
      @book.update(book_params)
      flash[:update_error] = "update error"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
      redirect_to books_path
      flash[:destroy] = 'successflly destroyed!'
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end

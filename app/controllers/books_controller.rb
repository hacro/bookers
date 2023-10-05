class BooksController < ApplicationController
  # def new
  # end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:success] = "Successfully created!"
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
      flash[:success] = "Successfully updated!"
    else
      @book = Book.find(params[:id])
      render :edit
      flash[:fail] = "Edit failed..."
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to '/books'
      flash[:destroy] = 'Successflly destroyed!'
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end

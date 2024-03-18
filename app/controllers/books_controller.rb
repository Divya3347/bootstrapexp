class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).order("name").page params[:page]
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to root_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book =  Book.find(params[:id])
    if @book.update(book_params)
      flash[:updatee] = "Book was successfully updated."
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:deletee] = "Book was Successfully  deleted."

    redirect_to root_path
  end

  def delete_avatar
    @book = Book.find(params[:id])
    avatar = @book.avatars.find(params[:avatar_id])
    avatar.purge
    redirect_to @book
    flash[:notice] = "Image has been removed from book page"
  end

  private
  def book_params
    params.require(:book).permit(:name,:price, :author, :quantity ,:name_cont , avatars:[])
  end
end

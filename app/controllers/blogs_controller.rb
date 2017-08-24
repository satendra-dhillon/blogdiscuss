class BlogsController < ApplicationController

	before_action :set_blog, only: [:show, :edit, :update, :destroy]

	def index
    if params[:search]
      @blogs = Blog.search(params[:search])#.order("created_at DESC")
    elsif params[:filter]
      @blogs = Blog.where(category_id: params[:filter])#.order("created_at DESC")
    else
      @blogs = Blog.all.order('created_at DESC')
    end
	end

	def show
  end

  def edit
  end

  def new
  	@blog = Blog.new
  end

  def create
  	@blog = Blog.new(blog_params)

  	respond_to do |format|
  		if @blog.save
  			format.html {redirect_to @blog, notice: "Blog successfully created!"}
  		else
  			format.html { render :new }
  		end
  	end
  end


  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  
  def set_blog
  	@blog = Blog.find(params[:id])
  end

  def blog_params
  	params.require(:blog).permit(:title, :description, :category_id, {tag_ids: []}).merge(blogger_id: current_user.id )
  end

end

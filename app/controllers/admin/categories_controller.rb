class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      flash[:notice] = "Must name category"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    @items = Item.all
  end

  def update
    byebug
    @category = Category.find(params[:id])
    @category.update(category_params)
    items = Item.all
    items.each do |item|
      puts "Key #{params["#{item.id.to_s}"].keys}"
    end
    redirect_to admin_category_path(@category)
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, category_ids: [])
  end

end

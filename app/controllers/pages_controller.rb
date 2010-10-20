class PagesController < ApplicationController
  
  def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def index
    if user_signed_in?
      redirect_to budgets_url
    else
      render :index
    end
  end
  
end

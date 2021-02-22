module ApplicationHelper
  def current_user
    User.where(id: session[:user_id]).first
  end

  def logged_in?
    return render 'layouts/unsigned_in_user' unless current_user

    render 'layouts/signed_in_user'
  end
end

class SessionsController < ApplicationController
   skip_before_filter :authorize
  def create
       user=User.authenticate(params[:password])
        if  user
       session[:user_id]=user.id
       redirect_to rooms_url
      else
       redirect_to login_url, :alter =>"hhh"
     end
  end

  def new
  end
end

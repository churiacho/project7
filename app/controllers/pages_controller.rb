class PagesController < ApplicationController

  def go
    redirect_to(activities_path)  
    unless user_signed_in?
      redirect_to(new_user_session_path, alert)
    end
  end


end

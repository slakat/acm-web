class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def fb_connection
  	 @graph = Koala::Facebook::API.new("691458674288492|b8z1TnS7Sjlh1QZchryVw62DhM0")

    #fields="id,name,description,place,timezone,start_time,cover";

    #json_link = "https://graph.facebook.com/{1545470725714675}/events/attending/?fields={$fields}&access_token={691458674288492|b8z1TnS7Sjlh1QZchryVw62DhM0}&since={$since_unix_timestamp}&until={$until_unix_timestamp}";

    Koala.config.api_version = 'v2.3'
    @oauth = Koala::Facebook::OAuth.new '691458674288492', '4ce2805661fa537094efeabe56b8861c'
    access_token =@oauth.get_app_access_token
    @graph = Koala::Facebook::API.new access_token
  end
end

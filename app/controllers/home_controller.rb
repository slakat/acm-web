require 'net/http'

class HomeController < ApplicationController
  before_filter :fb_connection, :only => [:events,:news]

  def index
  end

  def events
    #https://graph.facebook.com/acm.puc/events/?fields=id,name,description,timezone,start_time,cover&access_token=&since=1356998400&until=1483228800
    @events = @graph.get_connection('acm.puc', 'events', {since: '1356998400',until:'1483228800', limit: 5, fields: ['name', 'id', 'description', 'timezone','start_time','cover']})
  end

  def news
    results = @graph.get_connection('acm.puc', 'posts', {limit: 100, fields: ['message', 'id', 'from', 'type','picture', 'link', 'created_time', 'updated_time','actions']})
    wanted_keys = %w[status link]
    @posts = results.select {|f| wanted_keys.include? f["type"]}
    #puts @posts
  end

  def gallery
  end

  def about
  end
end

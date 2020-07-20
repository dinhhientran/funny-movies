class ShareController < ApplicationController

  YOUTUBE_URL_REGEX = /^(http(s)??\:\/\/)?(www\.)?((youtube\.com\/watch\?v=)|(youtu.be\/))([a-zA-Z0-9\-_])+/

  before_action :authorized

  def index
  end

  def share
    youtubeUrl = params[:youtube_url]
    if isValidYoutubeUrl(youtubeUrl)
      video = VideoInfo.new(youtubeUrl)
      if video.available?
        Movie.create(
          :user_id => current_user.id,
          :title => video.title,
          :description => video.description,
          :embed_code => video.embed_code,
          :url => video.url
        )
        redirect_to root_path
      else
        flash[:alert] = {:youtube_url => ['This Youtube video is not available!']}
        redirect_to share_path
      end
    else
      flash[:alert] = {:youtube_url => ['Youtube URL is not valid!']}
      redirect_to share_path
    end
  end

  private
  def isValidYoutubeUrl(url)
    return !url.nil? && url.match(YOUTUBE_URL_REGEX)
  end
end

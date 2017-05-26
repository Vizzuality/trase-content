class ApiController < ApplicationController
  def posts
    posts = Post.order(:date => 'DESC').where(:state => 1)
    render json: posts
  end

  def site_dive
    render json: SiteDive.find(params[:id])
  end

  def tweets
    render json: [] and return unless ENV['TWITTER_CONSUMER_KEY'].present? and ENV['TWITTER_CONSUMER_SECRET'].present? and ENV['TWITTER_ACCESS_TOKEN'].present? and ENV['TWITTER_ACCESS_TOKEN_SECRET'].present?

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end

    tweets = client.user_timeline

    tweets = tweets.map {|tweet|
      {'id' => tweet.id, 'text' => hidrate_tweet(tweet.full_text, tweet.urls, tweet.hashtags, tweet.user_mentions), 'screen_name' => tweet.user.screen_name, 'created_at' => tweet.created_at}
    }
    render json: tweets
  end

  private

  def hidrate_tweet(text, urls, hashtags, mentions)
    processed = text.dup
    urls.each do |url|
      processed.gsub! url.url, "<a target='_blank' rel='noopener noreferrer' href='#{url.expanded_url}'>#{url.display_url}</a>"
    end
    hashtags.each do |hashtag|
      processed.gsub! "##{hashtag.text}", "<a target='_blank' rel='noopener noreferrer' href='https://twitter.com/hashtag/#{hashtag.text}'>##{hashtag.text}</a>"
    end
    mentions.each do |mention|
      processed.gsub! "@#{mention.screen_name}", "<a target='_blank' rel='noopener noreferrer' href='https://twitter.com/#{mention.screen_name}'>@#{mention.screen_name}</a>"
    end
    processed
  end
end

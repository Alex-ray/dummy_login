get '/' do
  @invalid_url = params[:invalid_url]
  erb :index
end

post '/urls' do
  @url = params[:url][:long_url]
  @short_url = shortener(@url)
  if !Url.create({url: @url, short_url: @short_url}).valid?
    redirect to "/?invalid_url=?#{@url}"
  else
    erb :new_urls
  end
end

# e.g., /q6bda
get '/:short_url' do
  shorty = params[:short_url]
  url_object = Url.where("short_url = ?", shorty).first
  long_url = url_object.url
  url_object.click_counter += 1
  url_object.save
  redirect to long_url
end


def shortener(url)
  short_url = SecureRandom.hex(4)
  shortener(url) if Url.exists?(short_url: short_url)
  short_url
end
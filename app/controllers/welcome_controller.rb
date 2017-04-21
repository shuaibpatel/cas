class WelcomeController < ApplicationController
 
 #Next methods use the twitter API for different tasks
def create_access_token(oauth_token, oauth_token_secret)
consumer = OAuth::Consumer.new("rH8S66dijW7cYX2veCSS0xtHK",
"MXAnfLXwxR0L4eILQSMjPMHClW081P8OW5fNS2QOSCpncLPn2A",
{ :site => "https://api.twitter.com",
:scheme => :header
})
# create the access token
token_hash = { :oauth_token => oauth_token,
:oauth_token_secret => oauth_token_secret
}
access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
return access_token
end
def twittertrends
if session[:user_id] != nil
access_token = create_access_token("845361426290147329-jbdyALVDSXPI4uVFNgHc1gHmk8KkGNL", "PWhsZSt2897NyWkAxtQyMVkajYz9Ac8KbzjJca0sdIDBN")
# use the access token to get the trends
response = access_token.request(:get,
"https://api.twitter.com/1.1/trends/available.json")
info = JSON.parse(response.body)
render json: info
end
def customtweets
if session[:user_id] != nil
access_token = create_access_token(" 845361426290147329-jbdyALVDSXPI4uVFNgHc1gHmk8KkGNL",
"PWhsZSt2897NyWkAxtQyMVkajYz9Ac8KbzjJca0sdIDBN")
# use the access token to get tweets on programming
response = access_token.request(:get,
"https://api.twitter.com/1.1/search/tweets.json?q=programming")
info = JSON.parse(response.body)
render json: info
end
end
def morecustomtweets
if session[:user_id] != nil
access_token = create_access_token(" 845361426290147329-jbdyALVDSXPI4uVFNgHc1gHmk8KkGNL",
"PWhsZSt2897NyWkAxtQyMVkajYz9Ac8KbzjJca0sdIDBN")
# use the access token to get tweets on programming that have been
# posted until 18 October 2014
response = access_token.request(:get,
"https://api.twitter.com/1.1/search/
tweets.json?q=programming&until=2014-10-18")
info = JSON.parse(response.body)
render json: info
end
end
end
end

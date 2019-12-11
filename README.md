# poetdiary
book of poems
# MIT LICENSE
https://github.com/Sydnee510/poetdiary/pull/1

# Create an account- each account has only one author
get '/signup'
post '/signup'
# Login as an author
get '/login'
post '/login'
# Show error code
get '/failure'
# Create poem
get '/poems/new
post '/poems'
# Read poem
get '/poems'
get '/poems/:id'
# Update poem
get '/poems/:id/edit'
patch '/poems/:id'
# Delete poem
delete '/poems/:id'




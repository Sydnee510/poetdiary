# poetdiary
A book of poems where you can create and store your favorite pieces.
# MIT LICENSE
https://github.com/Sydnee510/poetdiary/pull/1

# Create an account- each account has only one author
get '/signup'
<br>
post '/signup'
# Login as an author
get '/login'
<br>
post '/login'
# Show error code
get '/failure'
# Create poem
get '/poems/new
<br>
post '/poems'
# Read poem
get '/poems'
<br>
get '/poems/:id'
# Update poem
get '/poems/:id/edit'
<br>
patch '/poems/:id'
# Delete poem
delete '/poems/:id'




#incomplete code

get '/playground' do
  @adjective = ["nice", "alright", "decent"].shuffle.first
  erb :playground
end

__END__
@@layout
<h1> Ideabox </h1>

<%= yield %>

<footer>
  <p>&copy; <%= Time.now.year %> The Turing School  </p>
</footer>


@@ playground
<h2> Hello World </h2>
<p> You look <%= @adjective %> today.</p>

get '/' do
  erb :index
end

get '/anagrams/:word' do
  @word = params[:word]
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end

def only_letters?(input)
  lowercase = ('a'..'z')
  uppercase = ('A'..'Z')
  if input.each_char.all? { |char| lowercase.cover?(char) || uppercase.cover?(char) }
    true
  else
    false
  end
end

def valid_input?(input)
  if input.length < 2
    raise Exception.new("Word must be at least two letters.")
  elsif only_letters?(input) == FALSE
    raise Exception.new("Word must consist of only letters.")
  elsif !Word.find_by_text(input).present?
    raise Exception.new("That word doesn't exist in our dictionary. Click Add a Word to add it!")
  end
end

post '/' do
  @word = params[:word]
  begin
    valid_input?(@word)
    redirect "/anagrams/#{@word}"
  rescue Exception => error
    @error = error.message
    erb :index
  end
end




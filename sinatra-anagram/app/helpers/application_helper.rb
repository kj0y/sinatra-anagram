module ApplicationHelper
    def words_form_action(word)
        if word.new_record?
          @action = "/words"
        else
          @action = "/words/#{@word.id}"
        end
        @action
      end
    
    
    def words_form_method(word)
        if word.new_record?
            @method = "post"
        else
            @method = "put"
        end
        @method
    end

    def words_form_class(word)
        if word.new_record?
            @class = "new-word"
        else
            @class = "edit-word"
        end
        @class
    end

    # Retrieve word ID if it already exists, otherwise set it to new-word.
    def words_form_id(word)
        if word.new_record?
            @id = "new-word"
        else
            @id = "word-#{@word.id}"
        end
        @id
    end

end
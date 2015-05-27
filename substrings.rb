def substrings(string, dictionary)
    # set default value to 0, increment by 1 when a match is found
    word_counts = Hash.new 0
    words = string.split

    dictionary.each do |search_term, count|
        words.each do |word|
            word_counts[search_term.to_sym] += 1 if word.downcase.match(/#{search_term}/)
        end
    end

    word_counts
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
p substrings("Howdy partner, sit down! How's it going?", dictionary)


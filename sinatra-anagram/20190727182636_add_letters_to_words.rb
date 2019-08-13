class AddLettersToWords < ActiveRecord::Migration
  def change
    add_column :words, :letters, :string
    
    Word.all.each do |words|
      characters = word.text.chars
      alphabetized_characters = characters.sort
      word.letters = alphabetized_characters.join
      word.save
    end
  end
end
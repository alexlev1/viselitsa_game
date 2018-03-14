require "unicode_utils/downcase"
require_relative "lib/game.rb"
require_relative "lib/result_printer.rb"
require_relative "lib/word_reader.rb"

current_path = File.dirname(__FILE__)

VERSION = "Игра виселица. Версия 4."

word_reader = WordReader.new
words_file_name = current_path + '/data/words.txt'

# Ввод готового слова из консоли
if ARGV[0] == nil
  word = word_reader.read_from_file(words_file_name)
else
  word = ARGV[0]
end

game = Game.new(word)
game.version = VERSION

printer = ResultPrinter.new(game)

while game.in_progress? do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
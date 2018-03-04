class ResultPrinter
  def initialize(game)
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= game.max_errors do
      file_name = current_path + "/../image/#{counter}.txt"
      begin
        f = File.new(file_name, 'r:UTF-8')
        @status_image << f.read
        f.close
      rescue SystemCallError => error
        @status_image << "\n [ Изображение не найдено ]\n"
      end
      counter += 1
    end
  end

  def cls
    system "clear" or system "cls"
  end

  def print_status(game)
    cls
    puts game.version

    puts "\nСлово: " + get_word_for_print(game.letters, game.good_letters)
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"
    print_viselitsa(game.errors)

    if game.lost?
      puts "Вы проиграли :( Слово было: #{game.letters.join}"
    elsif game.won?
      puts "Поздравляем! Вы выиграли!\n\n"
    else
      puts "У вас осталось попыток: #{game.errors_left}"
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""

    letters.each do |letter|
      if good_letters.include?(letter)
        result += letter + " "
      else
        result += "__ "
      end
    end
    result
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end
end
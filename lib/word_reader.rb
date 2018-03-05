class WordReader
  def read_from_file(file_name)
    begin
      file = File.readlines(file_name)
    rescue SystemCallError => error
      puts "Ошибка! Проверьте наличие списка со словами."
    end
    file.sample.chomp
  end
end
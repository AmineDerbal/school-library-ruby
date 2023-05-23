module ListAllRentals
  def list_rentals
    puts 'Id of the person: '
    person_id = gets.chomp.to_i
    person = @rentals.select { |p| p[:id] == person_id }
    if person.empty?
      puts 'Person do not exist'

      return
    end
    puts "Rentals of #{person[0][:name]}:"
    person.each do |rental|
      puts "Date: #{rental[:date]} Book: #{rental[:title]} by #{rental[:author]}"
    end
  end
end

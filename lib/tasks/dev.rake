namespace :dev do

  desc "Configuracao de Ambiente de Desenvolvimento"
  task setup: :environment do
    puts "Resetando DB"
    %x(rails db:drop db:create db:migrate)
   
    ####################################################

    puts "Cadastrando os Tipos Contatos"

    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
      description: kind
      )
    end

    puts "Tipos de Contatos Cadastrados com Sucesso!"

    ####################################################

    puts "Cadastrando os Contatos"
      100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago,to: 18.years.ago),
        kind: Kind.all.sample
        )
    end
    puts "Contatos Cadastrados com Sucesso!"

    ####################################################
    
    puts "Cadastrando os telefones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
       phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
       contact.phones << phone
       contact.save
      end
    end

    puts "Telefones Cadastrados com sucesso"
    
    ####################################################
    
    puts "Cadastrando os telefones..."

    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereçõs cadastrados com sucesso"

  end 
end
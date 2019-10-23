Dado('ter um cep para realizar a busca') do |table|
  cep = table.rows_hash['cep']
  path = { path: cep }
  @query_cep_get = path
end

Quando('chamar o endpoint da viacep') do
  @query_cep = ViaCep.new
  @response = @query_cep.get_request(@query_cep_get)
end

Então('validar o retorno para o cenário {string}') do |tipo|
  if tipo.eql?('positivo')
    expect(@response.code).to eql 200
    expect(@response['cep']).to eql(@query_cep_get[:path].insert(5, '-'))
    expect(@response['logradouro']).to eql('Avenida dos Bandeirantes')
    expect(@response['complemento']).to eql('460')
    expect(@response['bairro']).to eql('Brooklin Paulista')
    expect(@response['localidade']).to eql('São Paulo')
    expect(@response['uf']).to eql('SP')
    expect(@response['ibge']).to eql('3550308')
    expect(@response['gia']).to eql('1004')
    puts "O Código do IBGE é : #{@response['ibge']}"
  else
    @response.code.eql?(200)
    expect(@response).to have_key('erro')
    @response['erro'].eql?(true)
  end
end

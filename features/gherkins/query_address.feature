#language:pt

Funcionalidade: Buscar endereço
  Eu Como candidato do teste
  Quero buscar as informações de endereço
  Para validar o cep

  @teste
  Esquema do Cenário: Validar o endpoint get da api viacep
    Dado ter um cep para realizar a busca
      | cep | <cep> |
    Quando chamar o endpoint da viacep
    Então validar o retorno para o cenário "<tipo>"

    Exemplos:
      | tipo     | cep      |
      | positivo | 04553900 |
      | negativo | 00000000 |
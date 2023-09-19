module ConteudoArquivos

  CONTEUDO_START_PROJECT = ["#!/bin/bash\n\n",
    "# Edite o caminho abaixo de acordo com sua necessidade\n",
      "ruby #{ARGV[1]}/view/janela_principal.rb"]
  
  CONTEUDO_README = ["# Este é um software desktop desenvolvido em Ruby e GTK\n\n",
    "## Imagens da aplicação\n\n",
    "<img src=\"\">\n\n",
    "## Sobre a aplicação \n\n",
    "## Como executar a aplicação"]          
  
  CONTEUDO_GEMFILE = ["# origem das gems \nsource 'https://rubygems.org'\n\n",
      "# versão do ruby \nruby '3.1.1' \n\n",
      "# suite de testes \ngem 'rspec', '3.11.0'\n\n",
      "# lib para gerar GUI \ngem 'gtk3', '3.5.1'\n\n",
      "# banco de dados padrão \ngem 'sqlite3', '1.4.2'\n\n",
      "# ORM padrão \ngem 'activerecord', '7.0.3'\n\n",
      "# gerador de conteúdo para testes do banco de dados \ngem 'faker', '2.21.0'\n\n",
      "# lib para gerar PDF's \ngem 'prawn'\n\n",
      "# lib para validar CPF, CNPJ \ngem 'documentos_br', '1.1'"]
  
  CONTEUDO_ARQUIVO_BANCO_DE_DADOS = ["require 'active_record'\n",
      "# require 'sqlite3'\n\n",
      "class BancoDeDados\n\n",
      "\t# teste esse método no IRB",
      "\tdef consegue_conectar?\n",
      "\t\tconexao = ActiveRecord::Base.establish_connection(adapter: 'sqlite3',database: 'banco/sqlite.db')\n",
      "\t\tActiveRecord::Base.retrieve_connection\n",
      "\t\tconexao.connected?\n",
      "\tend\n\n",
      "end\n\n"]
  
  CONTEUDO_ARQUIVO_RELATORIO = ["\nrequire 'prawn'\n\n",
      "class Relatorio\n\n",
      "\tPrawn::Document.generate('relatorio.pdf') do\n",
      "\t\ttext 'Hello World!'\n",
      "\tend\n\n",
      "end"]
  
  CONTEUDO_ARQUIVO_VALIDACOES = ["\nrequire 'documentos_br'\n\n",
      "class Validacoes\n\n",
      "\tdef verificaCPF(cpf)\n",
      "\t\tDocumentosBr.valid_cpf?(cpf)\n",
      "\tend\n\n",
      "end"]

  CONTEUDO_ARQUIVO_SEEDS = ["\nrequire 'faker'\nrequire 'documentos_br'\n\n",
      "class Seed\n\n",
      "\tputs('Gerando clientes...')\n",
      "\t100.times do |i|\n",
      "\t\tClient.create! name: Faker::Name.name,\n",
      "\t\tcpf: DocumentosBr.cpf\n",
      "\tend\n",
      "\tputs('Clientes gerados com sucesso!')\n\n",
      "end\n"]
      
  CONTEUDO_ARQUIVO_RSPEC = ["\n# require './classe_testada'\n\n# describe ClasseTestada do\n\n",
      "\t# context 'contexto geral das atividades testadas' do\n",
      "\t\t# it 'consegue fazer alguma coisa' do\n",
      "\t\t\t# expect(subject.metodo_sendo_testado).to eq(alguma_coisa)\n",
      "\t\t# end\n",
      "\t# end\n\n",
      "# end"]
      
end

$LOAD_PATH << '.'
require 'modules/conteudo_arquivos'

class Mini    

    #### As variáveis ARGV[0] e ARGV[1] comentadas abaixo, devem ser descomentadas para rodar o RSPEC ###

    # ARGV[0] = 'new'
    # ARGV[1] = 'projeto_teste'

    $sistema_operacional_idenficado = '' 
    
    $pastas_do_projeto = [ARGV[1],'model','controller','view','banco_de_dados',
    'imagens','relatorios']

    $arquivos_do_projeto = ['model/model.rb','model/validacoes.rb','model/seeds.rb',
        'controller/controller.rb','banco_de_dados/banco.rb','Gemfile','README.md',"start_project.sh"]

    $quantidade_de_pastas_criadas = 0

    $quantidade_de_arquivos_criados = 0

    def idenfica_sistema_operacional 
        if Gem::Platform.local.os == 'linux'
            $sistema_operacional_idenficado = 'linux'
            puts("sistema operacional identificado como: #{$sistema_operacional_idenficado}")
            true
        elsif Gem.win_platform?
            $sistema_operacional_idenficado = 'windows'
            puts("sistema operacional identificado como: #{$sistema_operacional_idenficado}")
            true
        else
            puts('sistema operacional não identificado')
            false
        end       
    end

    def criador_de_pastas_do_projeto        
        if ARGV[0] == 'new' and ARGV[1] != 0
            puts("\u001b[32mAguarde, criando o projeto: #{ARGV[1]}.")
            puts()
            $pastas_do_projeto.each do |pasta_sendo_criada|
                Dir.mkdir(pasta_sendo_criada)
                cronometro
                if Dir.exist?(pasta_sendo_criada)
                    $quantidade_de_pastas_criadas += 1
                    if $quantidade_de_pastas_criadas == 1
                        system("cp -a lib/janela_*.* #{pasta_sendo_criada}")# copia do framework para pasta do projeto
                        Dir.chdir(pasta_sendo_criada)
                    end
                end
            end
        end
        system("mv janela_*.* view")# copia da pasta do projeto para pasta view
        $quantidade_de_pastas_criadas
    end

    def criador_de_arquivos
        $arquivos_do_projeto.each do |arquivo_sendo_criado|
            arquivo = File.new(arquivo_sendo_criado, 'w')
            case arquivo_sendo_criado
                when "start_project.sh"
                    ConteudoArquivos::CONTEUDO_START_PROJECT.each do |conteudo|
                        arquivo.puts(conteudo)# arquivo só é fechado abaixo, após esse loop
                    end
                    arquivo.close
                when 'README.md'
                    ConteudoArquivos::CONTEUDO_README.each do |conteudo|
                        arquivo.puts(conteudo)# arquivo só é fechado abaixo, após esse loop
                    end
                    arquivo.close
                when 'Gemfile'
                    ConteudoArquivos::CONTEUDO_GEMFILE.each do |conteudo|
                        arquivo.puts(conteudo)# arquivo só é fechado abaixo, após esse loop
                    end
                    arquivo.close
                when 'banco_de_dados/banco.rb'
                    ConteudoArquivos::CONTEUDO_ARQUIVO_BANCO_DE_DADOS.each do |conteudo|
                        arquivo.puts(conteudo)# arquivo só é fechado abaixo, após esse loop    
                    end
                    arquivo.close
                when 'model/validacoes.rb'
                    ConteudoArquivos::CONTEUDO_ARQUIVO_VALIDACOES.each do |conteudo|
                        arquivo.puts(conteudo) # arquivo só é fechado abaixo, após esse loop
                    end
                    arquivo.close
                when 'model/seeds.rb'
                    ConteudoArquivos::CONTEUDO_ARQUIVO_SEEDS.each do |conteudo|
                        arquivo.puts(conteudo) # arquivo só é fechado abaixo, após esse loop
                    end
                    arquivo.close
                else
                    arquivo.puts("# Insira seu código aqui ;)")
                    arquivo.close
            end            
            cronometro
            if File.exist?(arquivo_sendo_criado)
                $quantidade_de_arquivos_criados += 1
            end
        end
        puts('')
        $quantidade_de_arquivos_criados
    end

    def configurador_prawn
        modelo_arquivo_relatorio = File.new('relatorios/relatorio.rb', 'w')
        if File.exist?(modelo_arquivo_relatorio)
            ConteudoArquivos::CONTEUDO_ARQUIVO_RELATORIO.each do |conteudo|
                modelo_arquivo_relatorio.puts(conteudo)# arquivo só é fechado abaixo, após esse loop
            end
            modelo_arquivo_relatorio.close
        end
        File.exist?('relatorios/relatorio.rb')
    end
    
    def configurador_rspec
        puts()
        system('rspec --init')
        puts()
        arquivo_rspec = File.open('.rspec','w')
        arquivo_rspec.puts("--require spec_helper\n--format documentation")
        arquivo_rspec.close
        modelo_arquivo_rspec = File.new('spec/test_spec.rb', 'w')
        ConteudoArquivos::CONTEUDO_ARQUIVO_RSPEC.each do |conteudo|
            modelo_arquivo_rspec.puts(conteudo)
        end
        modelo_arquivo_rspec.close
        puts("\u001b[32mRSPEC configurado com sucesso.")
        if File.exist?('.rspec')
            File.exist?('spec/test_spec.rb')
        end
    end

    def mostrador_mensagem_final
        if $quantidade_de_pastas_criadas == 7 and $quantidade_de_arquivos_criados == 8
            $pastas_do_projeto.each do |pasta|
                puts("\u001b[32mPasta #{pasta} criada.")
            end
            $arquivos_do_projeto.each do |arquivo|
                puts("\u001b[32mArquivo #{arquivo} criado.")
            end
            puts()
            puts("\u001b[32;1mPronto, projeto: #{ARGV[1]} criado com sucesso!")
            puts("Iniciando aplicação")
            system("cd #{ARGV[1]}")
            system("ruby #{Dir.pwd}/view/janela_principal.rb")
            true
        end        
    end

    def cronometro
        tempo = 1
        while tempo > 0
            sleep 1
            tempo = tempo - 1
            print("\u001b[32m*")            
        end
    end
end

### Comentar os comandos abaixo para rodar o RSPEC ###

m = Mini.new
m.idenfica_sistema_operacional
m.criador_de_pastas_do_projeto
m.criador_de_arquivos
m.configurador_prawn
m.configurador_rspec
m.mostrador_mensagem_final


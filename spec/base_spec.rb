require './mini'
require 'fileutils'

describe Mini do
    # Apaga a pasta do projeto criada na execução anterior dos testes
    before(:all) do
        if Dir.exist?('projeto_teste')
            FileUtils.rm_r('projeto_teste',verbose: true)
            puts("a pasta 'projeto_teste' foi apagada")
        else
            puts("a pasta 'projeto_teste' não existe")
        end
    end

    context 'execucao das tarefas do framework' do

        it 'consegue_identificar_sistema_operacional' do
            expect(subject.idenfica_sistema_operacional).to eq(true)
        end

        it 'consegue criar pastas do projeto' do
            expect(subject.criador_de_pastas_do_projeto).to eq(7)
        end

        it 'consegue criar arquivos' do
            expect(subject.criador_de_arquivos).to eq(8)
        end

        it 'consegue configurar o prawn' do
            expect(subject.configurador_prawn).to eq(true)
        end

        it 'consegue configurar o rspec' do
            expect(subject.configurador_rspec).to eq(true)
        end

        it 'consegue exibir mensagem final' do
            expect(subject.mostrador_mensagem_final).to eq(true)
        end 
        
    end
end

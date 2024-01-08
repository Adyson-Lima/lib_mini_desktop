# Bem vindo(a) à lib_mini_desktop

## Esta lib cria uma base MVC para desenvolver aplicações desktop em ruby com interface gráfica baseada em GTK.

### Recursos disponíveis
- [X] Geração de telas base em GTK3
- [X] Geração do arquivo GEMFILE
- [X] Geração de estrutura MVC
- [X] Configuração do RSPEC
- [X] Configuração do PRAWN

### Requisitos:
- Ruby 3
- Criador de interfaces gráficas GLADE (em estudo a migração para outra ferramenta)
- Gem gtk3 para criação de interfaces gráficas em ruby

### Utilização
```bash
# baixe a pasta lib_mini_desktop para um diretório de sua preferência.

# Entre na pasta lib_mini_desktop
cd lib_mini_desktop

# Rode o comando abaixo para criar um projeto com o nome de sua preferência
ruby mini.rb new nome_do_projeto

# edite o script nome_do_projeto/start_project.sh de acordo com sua necessidade, para rodar sua aplicação

# Utilize o Glade para editar a tela inicial da aplicação na pasta nome_do_projeto/view



```

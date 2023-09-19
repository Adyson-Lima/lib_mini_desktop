require "gtk3"

class JanelaPrincipal
  # Carrega arquivo .glade
  arquivo_glade = "#{File.expand_path(File.dirname(__FILE__))}/janela_principal.glade"

  # Constroi uma instancia de Gtk::Builder e carrega elementos do arquivo .glade
  construtor_janela = Gtk::Builder.new(:file => arquivo_glade)

  # Conecta a janela ao evento de sair
  janela_principal = construtor_janela.get_object("janela_principal")
  janela_principal.set_title("Janela Externa")
  janela_principal.signal_connect("destroy") { Gtk.main_quit }

  # Carrega menus da barra de menus
  menu_abrir = construtor_janela.get_object("menu_abrir")
  menu_sair = construtor_janela.get_object("menu_sair")

  # Carrega a janela interna
  menu_abrir.signal_connect("activate") { 
    # Carrega arquivo .glade
    arquivo_glade = "#{File.expand_path(File.dirname(__FILE__))}/janela_interna.glade"
    
    # Constroi uma instancia de Gtk::Builder e carrega elementos do arquivo .glade
    construtor_janela = Gtk::Builder.new(:file => arquivo_glade)
    
    # Carrega a janela interna e exibe com show()
    janela_interna = construtor_janela.get_object("janela_interna")
    janela_interna.set_title("Janela Interna")
    janela_interna.show()
  }

  menu_sair.signal_connect("activate") { 
    puts 'Saindo agora...'
    Gtk.main_quit 
  }

  Gtk.main
 
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

content = <<eos
var globalGoon;
function nextDay(day, stop) {
  $('#rpg_options').html("Dia " + day);
  if(day==stop) {
    globalGoon();
    return;
  }
  window.setTimeout("nextDay(" + (day+1) + "," + stop + ");", 50);
}
$(function() {
  var data = {
    steps: {
      0 : { text : 'Dia 1. Sua empresa precisa armazenar um cadastro de clientes, projetos, produtos etc. Para isso ela decide usar um banco de dados relacional. A empresa ainda não possui nenhuma instalação de bancos relacionais. O que você faz?', targets : [
        ['instala_na_net', 'Instala a última versão do Mysql em um servidor da empresa que já está na internet.', 10],
        ['cria_na_net','Cria um novo servidor conectado a internet e instala a última versão do Mysql', 10],
        ['instala_interno','Cria um novo servidor, não o deixa conectado a internet mas sim a rede interna, e instala a última versão do Mysql', 10]
      ] },
      
      10 : { text : 'Dia 50. Precisamos de uma nova funcionalidade no banco de dados relacional. Ele precisa suportar o armazenamento de dados binários que são o resultado de uma análise de áudio. Para isso: ', targets : [
        ['plugin_famoso','Encontra-se o plugin mais famoso na internet e configura o mesmo no Mysql (previsao: 20 dias)', 20],
        ['desenvolve_plugin','Desenvolve um plugin internamente na empresa (previsao: 30 dias)', 20]
      ], before : function(goon) {
        $('#text').html("E os dias passam...");
        globalGoon = goon;
        nextDay(2, 50);
      } },

      20 : { text : 'Dia 180. Sai uma atualização de segurança do Mysql. Sua equipe está totalmente focada em um bug em produção. O que você faz?', targets : [
        ['seguranca_primeiro','Para momentaneamente a correção do bug para aplicar o path de segurança e manter seu software atualizado.', 30],
        ['bug_primeiro','Continua com a correção do bug e ataca o problema da segurança quando o bug for corrigido.', 30]
      ], before : function(goon) {
        $('#text').html("Projeto em produção... dinheiro entrando, bugs surgindo e sendo corrigidos em grande quantidade nos primeiros meses");
        globalGoon = goon;
        nextDay(51, 180);
      } },

      30 : { text : 'Ao aplicar o patch descobre-se que um hacker já havia entrado na máquina e roubado os dados no dia anterior. O tempo que levou para atualizar a máquina não foi o suficiente para prevenir um ataque. Note que manter os softwares atualizados da trabalho e podemos não nos preocupar com essa tarefa caso contratemos uma empresa para fazer o host e a manutenção do software.', targets : [
        ['fim','Esse é um dos pontos onde Software as a Service ajuda: manter o mesmo atualizado o tempo todo. Outras soluções de Cloud também tentam aliviar esse tipo de preocupação.', -1],
      ]}
    }
  };
  rpg(data).start();
});
eos
# Exercise.create({:content => content})
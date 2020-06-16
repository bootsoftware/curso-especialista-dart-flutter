void main(List<String> args) {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  // Baseado no array acima monte um relatório onde mostre
  // Apresente a quantidade de pacientes com mais de 20 anos

  int qtd = 0;

  var rahman = [];
  var silva = [];
  var verne = [];
  for (var i = 0; i < pacientes.length; i++) {
    var paciente = pacientes[i].split('|');
    if (paciente[0].contains('Rahman')) {
      rahman.add(pacientes[i]);
    } else if (paciente[0].contains('Silva')) {
      silva.add(pacientes[i]);
    } else {
      verne.add(pacientes[i]);
    }

    if (int.parse(paciente[1]) >= 20) {
      qtd = qtd + 1;
    }
  }

  var familia;
  print('Família Rahman:');
  print('');

  for (familia in rahman) {
    print(familia);
  }
  print('');
  print('Família Silva:');
  print('');
  for (familia in silva) {
    print(familia);
  }
  print('');
  print('Família Verne:');
  print('');
  for (familia in verne) {
    print(familia);
  }
  print('');
  print('quantidade de pacientes com mais de 20 anos $qtd');

  // Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.
}

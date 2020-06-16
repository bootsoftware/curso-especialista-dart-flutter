main(List<String> args) {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  Set<String> pes = {};

  int fem = 0;
  int mas = 0;
  List femMaiorIdade = [];
  List masMaiorIdade = [];
  String pessoaVelha;

  // 1 - Remover os duplicados
  print('Removendo duplicados ...');
  print('');
  pessoas.forEach((f) {
    pes.add(f);
  });

  print('lista Atualizada ...');
  pes.forEach(print);
  // 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
  print('');
  print('Contador de Sexos ...');
  pes.forEach((e) {
    var p = e.split('|');
    if (p[2].toUpperCase() == 'MASCULINO') {
      mas++;
    } else {
      fem++;
    }
  });
  print('');
  print('Sexo Masculino: $mas Sexo Feminino: $fem');
  // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos
  //     e mostre a quantidade de pessoas com mais de 18 anos também separado por sexo
  print('');
  print('Filtrando Idade e Sexo ...');
  pes.forEach((e) {
    var p = e.split('|');
    var idade = int.parse(p[1]);
    var sexo = p[2].toUpperCase();
    if (idade > 18) {
      if (sexo == 'MASCULINO') {
        masMaiorIdade.add(e);
      } else {
        femMaiorIdade.add(e);
      }
    }
  });
  print('');
  print('Lista do Sexo Feminino:');
  femMaiorIdade.forEach(print);
  print('');
  print('quantidade do Sexo Feminino: ${femMaiorIdade.length}');

  print('');
  print('Lista do Sexo Masculino:');
  masMaiorIdade.forEach(print);
  print('');
  print('quantidade do Sexo Masculino: ${masMaiorIdade.length}');

  print('');
  print('Procurando a pessoa mais velha ...');
  var maiorIdade = 0;
  pes.forEach((e) {
    var p = e.split('|');
    var idade = int.parse(p[1]);

    if (idade > maiorIdade) {
      maiorIdade = idade;
      pessoaVelha = e;
    }
  });
  print('');
  print('A pessoa mais velha e: $pessoaVelha');
}

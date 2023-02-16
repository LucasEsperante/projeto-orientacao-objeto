import 'dart:ffi';

void main() {
  String nome = "laranja";
  double peso = 100.2;
  String cor = "verde e amarela";
  String sabor = "doce e citrica";
  int diasDesdeColheita = 40;
  bool isMadura;

  Legumes mandioca1 = Legumes("Macaxeira", 1200, "marrom", true);
  Fruta banana1 = Fruta("banana", 75, "amarela", "doce", 12);
  Nozes macadamia1 = Nozes("Macadami", 2, "branco", "doce", 20, 35);
  Citricas limao1 =Citricas("Limão", 100, "verde", "azedo", 5, 9);

  macadamia1.printAlimento();
  banana1.printAlimento();
  macadamia1.printAlimento();
  limao1.printAlimento();

  mandioca1.cozinhar();

}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

mostrarMadura(String nome, int dias, {String cor = "Sem cor"}) {
  if(dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  if(cor != null) {
    print("A $nome é $cor");
  }
}

bool funcEstaMadura (int dias){
  if(dias > 30) {
    return true;
  } else {
    return false;
  }
}

class Fruta extends Alimento implements Bolo{
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(String nome, double peso, String cor, this.sabor, this.diasDesdeColheita, {this.isMadura})
    :super(nome, peso, cor);

  void estaMadura(int diasParaMadura){
    isMadura = diasDesdeColheita >= diasParaMadura;
    print("A sua $nome ela foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura para poder comer, ela esta madura ? $isMadura");
  }

  void fazerSuco() {
    print("Você fez suco de $nome");
  }

  @override
  void seperarIngredientes(){
    print("seperar a fruta");
  }

  @override
  void fazerMassa(){
    print("misturar a fruta com a farinha");
  }

  @override
  void assar(){
    print("colocar no forn");
  }

}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento () {
    print("Este(a) $nome pesa $peso gramas e é $cor.");
  }
}

class Legumes extends Alimento implements Bolo{

  bool isPrecisaCozinhar;

  Legumes(String nome,double peso, String cor, this.isPrecisaCozinhar)
    : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar){
      print("Pronto,o $nome está cozinhando");
    }else {
      print("Não precisa cozinhar!");
    }
  } 

  @override
  void assar(){

  }

  @override
  void fazerMassa(){

  }

  @override
  void seperarIngredientes(){

  }

}

class Citricas extends Fruta{
  double nivelAzedo;

  Citricas(String nome,double peso,String cor, String sabor,int diasDesdeColheita, this.nivelAzedo)
    :super(nome, peso, cor, sabor, diasDesdeColheita); 

  void existeRefri(bool existe) {
    if(existe) {
      print("Existe refrigerante de $nome");
    }else {
      print("Não existe refrigerante de $nome");
    }
  }  
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome,double peso,String cor, String sabor,int diasDesdeColheita,this.porcentagemOleoNatural)
    :super(nome,peso,cor,sabor,diasDesdeColheita);

  @override 
  void fazerMassa() {
    print("tira a casaca");
    super.fazerMassa();
  }  
}

abstract class Bolo {
  void seperarIngredientes();

  void fazerMassa();

  void assar();
}

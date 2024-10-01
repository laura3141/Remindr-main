import 'package:flutter/material.dart';

class PurchaseDelayScreen extends StatefulWidget {
  @override
  _PurchaseDelayScreenState createState() => _PurchaseDelayScreenState();
}

class _PurchaseDelayScreenState extends State<PurchaseDelayScreen> {
  int? selectedOption; // Variável para armazenar a opção selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Você está próximo ao local de compra',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem estática do mapa
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'lib/assets/images/map.jpg', // Caminho para a imagem do mapa estático
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Título estilizado
            Text(
              'Adiar esta compra para:',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Container arredondado com fundo cinza ao redor do formulário
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Fundo cinza claro
                borderRadius: BorderRadius.circular(16.0), // Bordas arredondadas
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Sombra
                  ),
                ],
              ),
              child: Column(
                children: [

                  RadioListTile(
                    title: Text('daqui a 30 minutos', style: TextStyle(fontSize: 16)),
                    value: 1,
                    groupValue: selectedOption,
                    activeColor: Color(0xFFF9AA33),
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int?;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('daqui a 1 hora', style: TextStyle(fontSize: 16)),
                    value: 2,
                    groupValue: selectedOption,
                    activeColor: Color(0xFFF9AA33),
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int?;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('a próxima vez que eu estiver perto', style: TextStyle(fontSize: 16)),
                    value: 3,
                    groupValue: selectedOption,
                    activeColor: Color(0xFFF9AA33),
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int?;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Botão de salvar estilizado
            ElevatedButton(
              onPressed: () {
                // Ação ao salvar a escolha
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Opção de adiamento salva!'),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF9AA33), // Cor do botão
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF344955),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 50),
            IconButton(
              icon: Icon(Icons.home, size: 50),
              color: Colors.white,
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.map, size: 50),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PurchaseDelayScreen(), // Redireciona para a tela do mapa
                  ),
                );
              },
            ),
            SizedBox(width: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(context); // Função chamada ao pressionar o botão
        },
        child: Icon(Icons.add, size: 40, color: Colors.white),
        shape: StadiumBorder(),
        backgroundColor: Color(0xFFF9AA33),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showAddItemDialog(BuildContext context) {
    // Implemente aqui a função para adicionar item
  }
}

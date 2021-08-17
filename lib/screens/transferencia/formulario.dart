import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Nova transferência';

const _rotuloNumeroConta = 'Número da Conta';
const _dicaNumeroConta = '0000';
const _rotuloValor = 'Valor';
const _dicaValor = '0.00';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(_controllerNumeroConta, _rotuloNumeroConta, _dicaNumeroConta),
            Editor(_controllerValor, _rotuloValor, _dicaValor,
                Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criarTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final double? valor = double.tryParse(_controllerValor.text);
    final int? numeroConta = int.tryParse(_controllerNumeroConta.text);

    if (valor != null && numeroConta != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

import 'package:get_smart_pos/src/pigeon/get_smart_pos.pigeon.dart';

class CheckStatusRequest {
  const CheckStatusRequest({
    required this.callerId,
    this.allowPrintCurrentTransaction,
  });

  PigeonCheckStatusRequest toPigeon() {
    return PigeonCheckStatusRequest(
      callerId: callerId,
      allowPrintCurrentTransaction: allowPrintCurrentTransaction,
    );
  }

  /// Neste parâmetro deve-se enviar o callerId
  /// que identifica a transação a ser consultada.
  ///
  /// Este identificador é de responsabilidade da
  /// automação, e precisa ter sido utilizado em
  /// uma requisição de Pagamento v3 antes da
  /// Consulta Status.
  final String callerId;

  /// Ao habilitar este parâmetro, o aplicativo
  /// Pagamento não vai imprimir os
  /// comprovantes do estabelecimento e do
  /// cliente. Seu aplicativo ficará responsável pela
  /// impressão dos comprovantes.
  /// Mais detalhes na seção Responsabilidade de Impressão.
  /// - Para desabilitar: “false”
  /// - Para habilitar: “true”
  ///
  ///
  /// Default: “false”
  final bool? allowPrintCurrentTransaction;
}

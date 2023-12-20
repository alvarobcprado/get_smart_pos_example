import 'package:get_smart_pos/src/models/payment/payment_credit_type.dart';
import 'package:get_smart_pos/src/models/payment/payment_currency_position.dart';
import 'package:get_smart_pos/src/models/payment/payment_type.dart';
import 'package:get_smart_pos/src/pigeon/get_smart_pos.pigeon.dart';
import 'package:get_smart_pos/src/utils/extensions.dart';

class PaymentRequest {
  const PaymentRequest({
    required this.paymentType,
    required this.amount,
    required this.callerId,
    this.currencyPosition,
    this.currencyCode,
    this.creditType,
    this.installments,
    this.extraScreens,
    this.extraData,
    this.disableTypedTransaction,
    this.disableMagStripe,
    this.disableCustomerSlipSpace,
    this.allowPrintCurrentTransaction,
    this.orderId,
    this.additionalInfo,
  });

  PigeonPaymentRequest toPigeon() {
    return PigeonPaymentRequest(
      paymentType: paymentType.toPigeon(),
      amount: amount.toPigeon(),
      callerId: callerId,
      currencyPosition: currencyPosition?.toPigeon(),
      currencyCode: currencyCode,
      creditType: creditType?.toPigeon(),
      installments: installments?.toPigeon(),
      extraScreens: extraScreens,
      extraData: extraData,
      disableTypedTransaction: disableTypedTransaction,
      disableMagStripe: disableMagStripe,
      disableCustomerSlipSpace: disableCustomerSlipSpace,
      allowPrintCurrentTransaction: allowPrintCurrentTransaction,
      orderId: orderId,
      additionalInfo: additionalInfo,
    );
  }

  /// Este parâmetro informa qual o tipo de
  /// pagamento que será feito:
  /// - credit
  /// - debit
  /// - voucher (\*)
  /// - pix (\*)
  ///
  /// (\*) Voucher e Pix podem ser usados no
  /// Pagamento v3, mas apenas em pagamentos
  /// sem Split de Pagamento.
  final PaymentTypeRequest paymentType;

  /// Este parâmetro informa o valor da venda.
  final double amount;

  /// Neste parâmetro deve ser enviado um valor
  /// único para cada requisição realizada
  /// (deeplink).
  ///
  /// Este identificador é de responsabilidade da automação e
  /// pode ser utilizado para consultar o status de
  /// transações a partir do deeplink Consulta Status.
  ///
  ///
  /// String de até 50 caracteres.
  final String callerId;

  /// Se informado “credit” no parâmetro
  /// “paymentType” então o “creditType”
  /// deverá ser informado com o tipo de crédito:
  /// - `creditMerchant` - Crédito parcelado
  /// Lojista
  /// - `creditIssuer` - Crédito parcelado Emissor
  ///
  ///
  /// Crédito à vista não precisa enviar este
  /// campo.
  final PaymentCreditType? creditType;

  /// `CURRENCY_AFTER_AMOUNT` ou
  /// `CURRENCY_BEFORE_AMOUNT`
  /// Default : `CURRENCY_BEFORE_AMOUNT`
  final PaymentCurrencyPosition? currencyPosition;

  /// Código da moeda, de acordo com a ISO4217.
  ///
  /// Exemplo: "986" este é código do Real (R$)
  ///
  /// Para a lista completa das moedas acesse:
  /// https://pt.wikipedia.org/wiki/ISO_4217
  ///
  ///
  /// Default: “986”
  final String? currencyCode;

  /// Este parâmetro informa o número de
  /// parcelas.
  ///
  /// (\*) Se informado o parâmetro `creditType`
  /// com o valor `creditMerchant` ou
  /// `creditIssuer` então este parâmetro deve
  /// ser informado.
  final int? installments;

  /// Este parâmetro define como tem que ser
  /// apresentada a(s) tela(s) adicional(is) após o
  /// portador do cartão preencher a senha.
  ///
  /// Mais detalhes na seção Telas Adicionais.
  ///
  ///
  /// (\*) Para utilizar o Split de Pagamento, não é
  /// permitido enviar este parâmetro. Se
  /// enviado na requisição, será retornado um
  /// erro.
  final String? extraScreens;

  /// Este parâmetro serve para o adicionar
  /// campos para ser enviado para o host da
  /// Getnet.
  ///
  /// Mais detalhes na seção Dados Adicionais.
  ///
  ///
  /// (\*) Para utilizar o Split de Pagamento, não é
  /// permitido enviar este parâmetro. Se
  /// enviado na requisição, será retornado um
  /// erro.
  final String? extraData;

  /// Bloqueia a funcionalidade de digitar o
  /// número do portador do cartão na tela que
  /// solicitar o cartão.
  /// - Para desabilitar: “true”
  /// - Para habilitar: “false”
  ///
  ///
  /// Default: “false”
  final bool? disableTypedTransaction;

  /// Desabilita a leitora de cartões com tarja.
  /// - Para desabilitar: “true”
  /// - Para habilitar: “false”
  ///
  ///
  /// Default: “false”
  final bool? disableMagStripe;

  /// Desabilita o espaçamento final para o corte
  /// da via do cliente.
  /// - Para desabilitar: “false”
  /// - Para habilitar: “true”
  ///
  ///
  /// Default: “false”
  final bool? disableCustomerSlipSpace;

  /// Ao habilitar este parâmetro, o aplicativo
  /// Pagamento não vai imprimir os
  /// comprovantes do estabelecimento e do
  /// cliente.
  ///
  /// Seu aplicativo ficará responsável
  /// pela impressão dos comprovantes. Mais
  /// detalhes na seção Responsabilidade de
  /// Impressão.
  /// - Para desabilitar: “false”
  /// - Para habilitar: “true”
  ///
  ///
  /// Default: “false”
  final bool? allowPrintCurrentTransaction;

  /// Neste parâmetro deve ser enviado um valor
  /// único para cada pedido. Este identificador é
  /// de responsabilidade da automação e será
  /// repassado para o Conciliador.
  ///
  ///
  /// String de até 50 caracteres
  final String? orderId;

  /// Este parâmetro serve para acrescentar
  /// informações adicionais sobre o pagamento
  /// Pix que está sendo iniciado.
  ///
  /// Estas informações serão apresentadas ao
  /// pagador, em seu aplicativo de pagamento,
  /// após a leitura do QR Code Pix.
  ///
  /// Mais detalhes na seção Pix – Additional
  /// Info.
  final String? additionalInfo;
}

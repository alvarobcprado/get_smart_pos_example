// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get_smart_pos/src/models/common/common.dart';
import 'package:get_smart_pos/src/pigeon/get_smart_pos.pigeon.dart';
import 'package:get_smart_pos/src/utils/extensions.dart';

class PaymentResponse {
  PaymentResponse({
    required this.result,
    required this.amount,
    required this.callerId,
    required this.type,
    required this.inputType,
    required this.installments,
    this.resultDetails,
    this.nsu,
    this.nsuLastSuccessfullMessage,
    this.cvNumber,
    this.brand,
    this.gmtDateTime,
    this.nsuLocal,
    this.authorizationCode,
    this.cardBin,
    this.cardLastDigits,
    this.extraScreensResult,
    this.cardholderName,
    this.automationSlip,
    this.printMerchantPreference,
    this.orderId,
    this.pixPayloadResponse,
  });

  PaymentResponse.fromPigeon(PigeonPaymentResponse pigeon)
      : result = PaymentResult.fromPigeon(pigeon.result),
        amount = pigeon.amount.toCurrency(),
        callerId = pigeon.callerId,
        type = PaymentTypeResponse.fromPigeon(pigeon.type),
        inputType = PaymentInputType.fromPigeon(pigeon.inputType),
        installments = pigeon.installments.toIntOrNull(),
        resultDetails = pigeon.resultDetails,
        nsu = pigeon.nsu,
        nsuLastSuccessfullMessage = pigeon.nsuLastSuccessfullMessage,
        cvNumber = pigeon.cvNumber,
        brand = pigeon.brand,
        gmtDateTime = pigeon.gmtDateTime?.toDateTimeOrNull(),
        nsuLocal = pigeon.nsuLocal,
        authorizationCode = pigeon.authorizationCode,
        cardBin = pigeon.cardBin,
        cardLastDigits = pigeon.cardLastDigits,
        extraScreensResult = pigeon.extraScreensResult,
        cardholderName = pigeon.cardholderName,
        automationSlip = pigeon.automationSlip,
        printMerchantPreference = pigeon.printMerchantPreference,
        orderId = pigeon.orderId,
        pixPayloadResponse = pigeon.pixPayloadResponse;

  /// Resultado da transação
  final PaymentResult result;

  /// Valor da venda, se 0.0, então a venda não foi concluída
  final double amount;

  /// Retorna o callerId que foi enviado na requisição.
  ///
  /// Este identificador é de responsabilidade da
  /// automação.
  final String callerId;

  /// - 02 - Débito
  /// - 11 - Crédito a vista
  /// - 12 - Crédito parcelado Lojista
  /// - 13 - Crédito parcelado Emissor
  /// - 03 - Voucher
  /// - 30 - Pix
  final PaymentTypeResponse? type;

  /// - 021 - tarja magnética
  /// - 051 - chip
  /// - 071 - chip sem contato
  /// - 801 - tarja magnética - fallback
  final PaymentInputType? inputType;

  /// Quantidade de parcelas selecionada
  final int? installments;

  /// Texto com detalhes do retorno, conforme [PaymentResult]
  final String? resultDetails;

  /// Código de autorização da transação da Getnet –
  /// ele é único por terminal(CV impresso no
  /// comprovante, não pode se repetir no mesmo
  /// dia)
  final String? nsu;

  /// Último NSU da Getnet gerado com sucesso
  final String? nsuLastSuccessfullMessage;

  /// Número do CV – informação que deve ser
  /// enviada no estorno - ele é único por terminal
  final String? cvNumber;

  /// Bandeira do cartão utilizado
  final String? brand;

  /// Data e hora GMT da transação (MMDDhhmmss).
  ///
  /// Este campo representa o horário GMT
  final DateTime? gmtDateTime;

  /// NSU gerado no terminal(DOC impresso no
  /// comprovante, número sequencial por terminal)
  final String? nsuLocal;

  /// Código único de autorização (AUT impresso no
  /// comprovante, pode se repetir)
  ///
  /// *Este campo é de responsabilidade da
  /// bandeira*
  final String? authorizationCode;

  /// Os 6 primeiros dígitos do cartão
  final String? cardBin;

  /// Os 4 últimos dígitos do cartão
  final String? cardLastDigits;

  /// Quando for enviada na requisição o campo
  /// extraScreens. O retorno será o mesmo só que
  /// com o campo value do field preenchido.
  /// Mais detalhes na seção Telas Adicionais.
  final String? extraScreensResult;

  /// Retorna o nome do portador gravado no cartão,
  /// se disponível.
  final String? cardholderName;

  /// Neste parâmetro enviamos as informações que
  /// devem ser incluídas nos Comprovantes
  /// Impressos do estabelecimento e do cliente para
  /// transações de Crédito, Débito ou Voucher.
  ///
  /// Seu aplicativo só é obrigado a imprimir esses
  /// campos caso você opte por usar a funcionalidade
  /// Responsabilidade de Impressão, pois nesse caso
  /// o aplicativo Pagamento não irá imprimir os
  /// comprovantes.
  ///
  /// Este parâmetro não comtempla os
  /// comprovantes de transações Pix. Este é enviado
  /// no parâmetro pixPayloadResponse.
  ///
  ///
  /// Mais detalhes na seção Dados do Comprovante
  final String? automationSlip;

  /// Neste parâmetro retornamos se a Via do
  /// Estabelecimento deve ser impressa ou não.
  ///
  /// Ela pode variar dependendo da escolha do
  /// Estabelecimento.
  ///
  /// Esse parâmetro deve ser verificado caso você
  /// opte por usar a funcionalidade Responsabilidade
  /// de Impressão e a Via do Estabelecimento deve
  /// ser impressa conforme o retorno deste
  /// parâmetro.
  ///
  /// - true – Deve ser impressa a Via do
  /// Estabelecimento nos comprovantes de venda.
  /// - false – Não deve ser impressa a Via do
  /// Estabelecimento nos comprovantes de venda.
  final bool? printMerchantPreference;

  /// Retorna caso um orderId tenha sido enviado na
  /// requisição.
  /// Este identificador é de responsabilidade da
  /// automação e é repassado para o Conciliador.
  final String? orderId;

  /// (\*)Retorna quando a requisição de pagamento
  /// for do tipo Pix.
  /// Mais detalhes na seção Payload do Pix.
  final String? pixPayloadResponse;
}

// Autogenerated from Pigeon (v15.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

class PigeonPaymentRequest {
  PigeonPaymentRequest({
    required this.paymentType,
    required this.amount,
    required this.callerId,
    this.creditType,
    this.currencyPosition,
    this.currencyCode,
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

  String paymentType;

  String amount;

  String callerId;

  String? creditType;

  String? currencyPosition;

  String? currencyCode;

  String? installments;

  String? extraScreens;

  String? extraData;

  bool? disableTypedTransaction;

  bool? disableMagStripe;

  bool? disableCustomerSlipSpace;

  bool? allowPrintCurrentTransaction;

  String? orderId;

  String? additionalInfo;

  Object encode() {
    return <Object?>[
      paymentType,
      amount,
      callerId,
      creditType,
      currencyPosition,
      currencyCode,
      installments,
      extraScreens,
      extraData,
      disableTypedTransaction,
      disableMagStripe,
      disableCustomerSlipSpace,
      allowPrintCurrentTransaction,
      orderId,
      additionalInfo,
    ];
  }

  static PigeonPaymentRequest decode(Object result) {
    result as List<Object?>;
    return PigeonPaymentRequest(
      paymentType: result[0]! as String,
      amount: result[1]! as String,
      callerId: result[2]! as String,
      creditType: result[3] as String?,
      currencyPosition: result[4] as String?,
      currencyCode: result[5] as String?,
      installments: result[6] as String?,
      extraScreens: result[7] as String?,
      extraData: result[8] as String?,
      disableTypedTransaction: result[9] as bool?,
      disableMagStripe: result[10] as bool?,
      disableCustomerSlipSpace: result[11] as bool?,
      allowPrintCurrentTransaction: result[12] as bool?,
      orderId: result[13] as String?,
      additionalInfo: result[14] as String?,
    );
  }
}

class PigeonPaymentResponse {
  PigeonPaymentResponse({
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

  String result;

  String amount;

  String callerId;

  String type;

  String inputType;

  String installments;

  String? resultDetails;

  String? nsu;

  String? nsuLastSuccessfullMessage;

  String? cvNumber;

  String? brand;

  String? gmtDateTime;

  String? nsuLocal;

  String? authorizationCode;

  String? cardBin;

  String? cardLastDigits;

  String? extraScreensResult;

  String? cardholderName;

  String? automationSlip;

  bool? printMerchantPreference;

  String? orderId;

  String? pixPayloadResponse;

  Object encode() {
    return <Object?>[
      result,
      amount,
      callerId,
      type,
      inputType,
      installments,
      resultDetails,
      nsu,
      nsuLastSuccessfullMessage,
      cvNumber,
      brand,
      gmtDateTime,
      nsuLocal,
      authorizationCode,
      cardBin,
      cardLastDigits,
      extraScreensResult,
      cardholderName,
      automationSlip,
      printMerchantPreference,
      orderId,
      pixPayloadResponse,
    ];
  }

  static PigeonPaymentResponse decode(Object result) {
    result as List<Object?>;
    return PigeonPaymentResponse(
      result: result[0]! as String,
      amount: result[1]! as String,
      callerId: result[2]! as String,
      type: result[3]! as String,
      inputType: result[4]! as String,
      installments: result[5]! as String,
      resultDetails: result[6] as String?,
      nsu: result[7] as String?,
      nsuLastSuccessfullMessage: result[8] as String?,
      cvNumber: result[9] as String?,
      brand: result[10] as String?,
      gmtDateTime: result[11] as String?,
      nsuLocal: result[12] as String?,
      authorizationCode: result[13] as String?,
      cardBin: result[14] as String?,
      cardLastDigits: result[15] as String?,
      extraScreensResult: result[16] as String?,
      cardholderName: result[17] as String?,
      automationSlip: result[18] as String?,
      printMerchantPreference: result[19] as bool?,
      orderId: result[20] as String?,
      pixPayloadResponse: result[21] as String?,
    );
  }
}

class PigeonCheckStatusRequest {
  PigeonCheckStatusRequest({
    required this.callerId,
    this.allowPrintCurrentTransaction,
  });

  String callerId;

  bool? allowPrintCurrentTransaction;

  Object encode() {
    return <Object?>[
      callerId,
      allowPrintCurrentTransaction,
    ];
  }

  static PigeonCheckStatusRequest decode(Object result) {
    result as List<Object?>;
    return PigeonCheckStatusRequest(
      callerId: result[0]! as String,
      allowPrintCurrentTransaction: result[1] as bool?,
    );
  }
}

class PigeonCheckStatusResponse {
  PigeonCheckStatusResponse({
    required this.result,
    this.resultDetails,
    this.amount,
    this.callerId,
    this.nsu,
    this.nsuLastSuccessfullMessage,
    this.cvNumber,
    this.type,
    this.brand,
    this.inputType,
    this.installments,
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
    this.refunded,
  });

  String result;

  String? resultDetails;

  String? amount;

  String? callerId;

  String? nsu;

  String? nsuLastSuccessfullMessage;

  String? cvNumber;

  String? type;

  String? brand;

  String? inputType;

  String? installments;

  String? gmtDateTime;

  String? nsuLocal;

  String? authorizationCode;

  String? cardBin;

  String? cardLastDigits;

  String? extraScreensResult;

  String? cardholderName;

  String? automationSlip;

  bool? printMerchantPreference;

  String? orderId;

  String? pixPayloadResponse;

  String? refunded;

  Object encode() {
    return <Object?>[
      result,
      resultDetails,
      amount,
      callerId,
      nsu,
      nsuLastSuccessfullMessage,
      cvNumber,
      type,
      brand,
      inputType,
      installments,
      gmtDateTime,
      nsuLocal,
      authorizationCode,
      cardBin,
      cardLastDigits,
      extraScreensResult,
      cardholderName,
      automationSlip,
      printMerchantPreference,
      orderId,
      pixPayloadResponse,
      refunded,
    ];
  }

  static PigeonCheckStatusResponse decode(Object result) {
    result as List<Object?>;
    return PigeonCheckStatusResponse(
      result: result[0]! as String,
      resultDetails: result[1] as String?,
      amount: result[2] as String?,
      callerId: result[3] as String?,
      nsu: result[4] as String?,
      nsuLastSuccessfullMessage: result[5] as String?,
      cvNumber: result[6] as String?,
      type: result[7] as String?,
      brand: result[8] as String?,
      inputType: result[9] as String?,
      installments: result[10] as String?,
      gmtDateTime: result[11] as String?,
      nsuLocal: result[12] as String?,
      authorizationCode: result[13] as String?,
      cardBin: result[14] as String?,
      cardLastDigits: result[15] as String?,
      extraScreensResult: result[16] as String?,
      cardholderName: result[17] as String?,
      automationSlip: result[18] as String?,
      printMerchantPreference: result[19] as bool?,
      orderId: result[20] as String?,
      pixPayloadResponse: result[21] as String?,
      refunded: result[22] as String?,
    );
  }
}

class PigeonRefundRequest {
  PigeonRefundRequest({
    this.amount,
    this.transactionDate,
    this.cvNumber,
    this.originTerminal,
    this.allowPrintCurrentTransaction,
  });

  String? amount;

  String? transactionDate;

  String? cvNumber;

  String? originTerminal;

  bool? allowPrintCurrentTransaction;

  Object encode() {
    return <Object?>[
      amount,
      transactionDate,
      cvNumber,
      originTerminal,
      allowPrintCurrentTransaction,
    ];
  }

  static PigeonRefundRequest decode(Object result) {
    result as List<Object?>;
    return PigeonRefundRequest(
      amount: result[0] as String?,
      transactionDate: result[1] as String?,
      cvNumber: result[2] as String?,
      originTerminal: result[3] as String?,
      allowPrintCurrentTransaction: result[4] as bool?,
    );
  }
}

class PigeonRefundResponse {
  PigeonRefundResponse({
    required this.result,
    this.resultDetails,
    required this.amount,
    this.gmtDateTime,
    this.nsu,
    this.nsuLocal,
    this.nsuLastSuccessfullMessage,
    this.authorizationCode,
    this.cardBin,
    this.cardLastDigits,
    this.refundTransactionDate,
    this.refundCvNumber,
    this.refundOriginTerminal,
    this.cardholderName,
    this.automationSlip,
  });

  String result;

  String? resultDetails;

  String amount;

  String? gmtDateTime;

  String? nsu;

  String? nsuLocal;

  String? nsuLastSuccessfullMessage;

  String? authorizationCode;

  String? cardBin;

  String? cardLastDigits;

  String? refundTransactionDate;

  String? refundCvNumber;

  String? refundOriginTerminal;

  String? cardholderName;

  String? automationSlip;

  Object encode() {
    return <Object?>[
      result,
      resultDetails,
      amount,
      gmtDateTime,
      nsu,
      nsuLocal,
      nsuLastSuccessfullMessage,
      authorizationCode,
      cardBin,
      cardLastDigits,
      refundTransactionDate,
      refundCvNumber,
      refundOriginTerminal,
      cardholderName,
      automationSlip,
    ];
  }

  static PigeonRefundResponse decode(Object result) {
    result as List<Object?>;
    return PigeonRefundResponse(
      result: result[0]! as String,
      resultDetails: result[1] as String?,
      amount: result[2]! as String,
      gmtDateTime: result[3] as String?,
      nsu: result[4] as String?,
      nsuLocal: result[5] as String?,
      nsuLastSuccessfullMessage: result[6] as String?,
      authorizationCode: result[7] as String?,
      cardBin: result[8] as String?,
      cardLastDigits: result[9] as String?,
      refundTransactionDate: result[10] as String?,
      refundCvNumber: result[11] as String?,
      refundOriginTerminal: result[12] as String?,
      cardholderName: result[13] as String?,
      automationSlip: result[14] as String?,
    );
  }
}

class _GetSmartPosHostApiCodec extends StandardMessageCodec {
  const _GetSmartPosHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PigeonCheckStatusRequest) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is PigeonCheckStatusResponse) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is PigeonPaymentRequest) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is PigeonPaymentResponse) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is PigeonRefundRequest) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is PigeonRefundResponse) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return PigeonCheckStatusRequest.decode(readValue(buffer)!);
      case 129: 
        return PigeonCheckStatusResponse.decode(readValue(buffer)!);
      case 130: 
        return PigeonPaymentRequest.decode(readValue(buffer)!);
      case 131: 
        return PigeonPaymentResponse.decode(readValue(buffer)!);
      case 132: 
        return PigeonRefundRequest.decode(readValue(buffer)!);
      case 133: 
        return PigeonRefundResponse.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class GetSmartPosHostApi {
  /// Constructor for [GetSmartPosHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  GetSmartPosHostApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _GetSmartPosHostApiCodec();

  Future<PigeonPaymentResponse> paymentV3(PigeonPaymentRequest request) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.get_smart_pos.GetSmartPosHostApi.paymentV3';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[request]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as PigeonPaymentResponse?)!;
    }
  }

  Future<PigeonCheckStatusResponse> checkStatus(PigeonCheckStatusRequest request) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.get_smart_pos.GetSmartPosHostApi.checkStatus';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[request]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as PigeonCheckStatusResponse?)!;
    }
  }

  Future<PigeonRefundResponse> refund(PigeonRefundRequest request) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.get_smart_pos.GetSmartPosHostApi.refund';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[request]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as PigeonRefundResponse?)!;
    }
  }
}

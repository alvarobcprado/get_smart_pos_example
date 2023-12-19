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
    required this.type,
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

  String type;

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
      type,
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
      type: result[0]! as String,
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

class _PaymentHostApiCodec extends StandardMessageCodec {
  const _PaymentHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PigeonPaymentRequest) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is PigeonPaymentResponse) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return PigeonPaymentRequest.decode(readValue(buffer)!);
      case 129: 
        return PigeonPaymentResponse.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class PaymentHostApi {
  /// Constructor for [PaymentHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  PaymentHostApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PaymentHostApiCodec();

  Future<PigeonPaymentResponse> paymentV3(PigeonPaymentRequest request) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.get_smart_pos.PaymentHostApi.paymentV3';
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
}

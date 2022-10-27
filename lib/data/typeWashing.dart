import 'package:mymovilapp/models/EBWs_TypeWashing.dart';
import 'package:mymovilapp/models/EBWs_ReasonWashing.dart';

List<EbWsTypeWashing> typeWashingListEmpty = <EbWsTypeWashing>[];
List<EbWsTypeWashing> typeWashingListBuseton = <EbWsTypeWashing>[
  EbWsTypeWashing(name: 'Lavado interno Buseton', id: 2, special: 0),
  EbWsTypeWashing(name: 'Desmanche Buseton', id: 3, special: 1),
  EbWsTypeWashing(name: 'Lavado Motor', id: 5, special: 1),
  EbWsTypeWashing(name: 'Fumigación', id: 6, special: 1),
  EbWsTypeWashing(name: 'Desinfección Buseton', id: 7, special: 0),
  EbWsTypeWashing(name: 'Lavado externo Buseton', id: 9, special: 0),
  EbWsTypeWashing(name: 'Polichado Buseton', id: 11, special: 0),
  EbWsTypeWashing(name: 'INTERNO-EXTERNO Buseton', id: 14, special: 0),
];
List<EbWsTypeWashing> typeWashingListPadron = <EbWsTypeWashing>[
  EbWsTypeWashing(name: 'Lavado externo Padron', id: 1, special: 0),
  EbWsTypeWashing(name: 'Polichado Padron', id: 4, special: 1),
  EbWsTypeWashing(name: 'Lavado Motor', id: 5, special: 1),
  EbWsTypeWashing(name: 'Fumigación', id: 6, special: 1),
  EbWsTypeWashing(name: 'Desmanche Padron', id: 8, special: 1),
  EbWsTypeWashing(name: 'Lavado interno Padron', id: 10, special: 0),
  EbWsTypeWashing(name: 'Desinfección Padron', id: 12, special: 0),
  EbWsTypeWashing(name: 'INTERNO-EXTERNO Padron', id: 13, special: 0),
];
List<EbWsReasonWashing> listReason = <EbWsReasonWashing>[
  EbWsReasonWashing(name: 'Servicio Transmilenio', id: 3),
  EbWsReasonWashing(name: 'Rutina Mantenimiento', id: 4),
  EbWsReasonWashing(name: 'Lavado por intervención', id: 5),
  EbWsReasonWashing(name: 'Lavado especial', id: 6),
];
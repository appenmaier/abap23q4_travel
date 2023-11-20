@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZR_ABAP23Q4_Booking
  as select from zabap23q4_bookng
  association to parent ZR_ABAP23Q4_Travel as _Travel on $projection.TravelUuid = _Travel.TravelUuid
  //booking as b left outer join travel as t on b.traveluuid = t.traveluuid
{
      @EndUserText: { label: 'Booking UUID', quickInfo: 'Booking UUID' }
  key booking_uuid  as BookingUuid,
      @EndUserText: { label: 'Travel UUID', quickInfo: 'Travel UUID' }
      travel_uuid   as TravelUuid,
      booking_id    as BookingId,
      booking_date  as BookingDate,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      
      /* Associations */
      _Travel
}

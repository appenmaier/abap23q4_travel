@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.allowExtensions: true
define view entity ZC_ABAP23Q4_Booking
  as projection on ZR_ABAP23Q4_Booking
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      CurrencyCode,

      /* Associations */
      _Travel : redirected to parent ZC_ABAP23Q4_Travel
}

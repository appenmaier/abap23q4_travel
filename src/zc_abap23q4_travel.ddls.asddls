@EndUserText.label: 'Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_ABAP23Q4_Travel
  provider contract transactional_query
  as projection on ZR_ABAP23Q4_Travel
{
  key TravelUuid,
      TravelId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ABAP23Q4_AgencyVH', element: 'AgencyId' } }]
      AgencyId,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      CurrencyCode,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_ABAP23Q4_StatusVH', element: 'Status' } }]
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Transient Data */
      CustomerName,
      BeginDateCriticality,

      /* Associations */
      _Bookings : redirected to composition child ZC_ABAP23Q4_Booking
}

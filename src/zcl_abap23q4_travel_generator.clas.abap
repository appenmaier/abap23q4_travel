CLASS zcl_abap23q4_travel_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap23q4_travel_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA travels TYPE TABLE OF zabap23q4_travel. " List<Travel> travels = new ArrayList<>();
    DATA travel  TYPE zabap23q4_travel.          " Travel travel = new Travel();
    DATA bookings TYPE TABLE OF zabap23q4_bookng.
    DATA booking TYPE zabap23q4_bookng.

    " DBTen für Reisen und Buchungen löschen
    DELETE FROM zabap23q4_travel.
    DELETE FROM zabap23q4_bookng.

    " Reisen und Buchungen erstellen
    travel-agency_id   = '000009'.
    travel-begin_date  = '20231030'.
    travel-booking_fee = 55.
    travel-client      = sy-mandt. " System.client();
    GET TIME STAMP FIELD travel-created_at.
    travel-created_by    = 'GENERATOR'.
    travel-currency_code = 'EUR'.
    travel-customer_id   = '000004'.
    travel-description   = 'Halloweentrip nach Hamburg'.
    travel-end_date      = '20231102'.
    GET TIME STAMP FIELD travel-last_changed_at.
    travel-last_changed_by = 'GENERATOR'.
    travel-status          = 'B'.
    travel-total_price     = 662.
    travel-travel_id       = '00000001'.
    travel-travel_uuid     = cl_system_uuid=>create_uuid_x16_static( ).
    APPEND travel TO travels.

    booking-booking_date = '20230708'.
    booking-booking_id = '8721'.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-carrier_id = 'LH'.
    booking-connection_id = '0538'.
    booking-client = sy-mandt.
    booking-currency_code = 'EUR'.
    booking-flight_date = travel-begin_date.
    booking-flight_price = '300'.
    booking-travel_uuid = travel-travel_uuid.
    APPEND booking TO bookings.

    booking-booking_date = '20230708'.
    booking-booking_id = '1236'.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-carrier_id = 'LH'.
    booking-connection_id = '0539'.
    booking-client = sy-mandt.
    booking-currency_code = 'EUR'.
    booking-flight_date = travel-end_date.
    booking-flight_price = '307'.
    booking-travel_uuid = travel-travel_uuid.
    APPEND booking TO bookings.

    travel-agency_id   = '000036'.
    travel-begin_date  = '20240707'.
    travel-booking_fee = 120.
    travel-client      = sy-mandt. " System.client();
    GET TIME STAMP FIELD travel-created_at.
    travel-created_by    = 'GENERATOR'.
    travel-currency_code = 'EUR'.
    travel-customer_id   = '000068'.
    travel-description   = 'Griechenland'.
    travel-end_date      = '20240731'.
    GET TIME STAMP FIELD travel-last_changed_at.
    travel-last_changed_by = 'GENERATOR'.
    travel-status          = 'B'.
    travel-total_price     = 2314.
    travel-travel_id       = '00000002'.
    travel-travel_uuid     = cl_system_uuid=>create_uuid_x16_static( ).
    APPEND travel TO travels.

    " travel.travelId = 34;
    " travels.add(travel);

    " DBTen für Reisen und Buchungen befüllen
    INSERT zabap23q4_travel FROM TABLE @travels.
    INSERT zabap23q4_bookng FROM TABLE @bookings.
  ENDMETHOD.
ENDCLASS.

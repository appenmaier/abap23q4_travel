@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text for Customer'
define view entity ZI_ABAP23Q4_CustomerText
  as select from /dmo/customer
{
  key customer_id                                                              as CustomerId,

      concat_with_space(title, concat_with_space(first_name, last_name, 1), 1) as Name
}

CLASS zcl_kitpoc019 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KITPOC019 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    out->write( 'Hello world!' ).
    DATA: lt_zkitpoc019 TYPE TABLE OF zkitpoc019_ta01.

    lt_zkitpoc019 = VALUE #(  ( businesspartner = '146853' firstname = '123asdg' lastname = '123216awad' nickname = 'A' emailaddress = '123asdg@Test.com' )
                              ( businesspartner = '981236' firstname = 'asdasdq2' lastname = 'wqweadz2' nickname = 'B' emailaddress = 'asdasdq2@Test.com' )
                              ( businesspartner = '123567' firstname = 'adwq146jk' lastname = 'zczsae44' nickname = 'C' emailaddress = 'adwq146jk@Test.com' )
                              ( businesspartner = '682139' firstname = 'qwe214ty' lastname = 'qweiuadl' nickname = 'D' emailaddress = 'qwe214ty@Test.com' )
                              ( businesspartner = '912834' firstname = '1237yaasd' lastname = '123adczq' nickname = 'E' emailaddress = '1237yaasd@Test.com' )
                              ( businesspartner = '112938' firstname = 'qwer314' lastname = 'qwertad23' nickname = 'F' emailaddress = 'qwer314@Test.com' ) ).

    MODIFY zkitpoc019_ta01 FROM TABLE @lt_zkitpoc019.
    IF sy-subrc = 0.
        COMMIT WORK AND WAIT.
        out->write( 'Hello world!' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.

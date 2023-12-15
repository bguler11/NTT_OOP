CLASS zbg_c_class2 DEFINITION
  PUBLIC
  INHERITING FROM zbg_c_class1
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      call.
  PROTECTED SECTION.
    METHODS division REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBG_C_CLASS2 IMPLEMENTATION.


  METHOD call .
    DATA lv_result TYPE /sttpec/e_maxhits_db.

    division(
    EXPORTING
      i_val_1 = 4
      i_val_2 = 2
    CHANGING
      c_val_1 = lv_result
    EXCEPTIONS
      ex_1    = 1
*      others  = 2
  ).
    IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

  ENDMETHOD.


  METHOD division.

    TRY.
        c_val_1 = i_val_1 / i_val_2.
      CATCH cx_sy_zerodivide.
        RAISE ex_1.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.

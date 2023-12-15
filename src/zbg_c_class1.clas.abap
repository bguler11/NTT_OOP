class ZBG_C_CLASS1 definition
  public
*  final
  create public .

public section.

  interfaces ZBG_INT_INSTANCE .
  interfaces ZBG_INT_STAT .
protected section.
  METHODS:
    division IMPORTING i_val_1 TYPE /STTPEC/E_MAXHITS_DB
                       i_val_2 TYPE /STTPEC/E_MAXHITS_DB
             CHANGING  c_val_1 TYPE /STTPEC/E_MAXHITS_DB
             EXCEPTIONS ex_1.
private section.
ENDCLASS.



CLASS ZBG_C_CLASS1 IMPLEMENTATION.


  METHOD division.
    TRY.
      c_val_1 = i_val_1 / i_val_2.
    CATCH cx_sy_zerodivide.
     RAISE ex_1.
    ENDTRY.

  ENDMETHOD.


  method ZBG_INT_INSTANCE~SUM.

    e_val_1 = i_val_1 + i_val_2.

  endmethod.


  method ZBG_INT_STAT~SUBS.

   e_val_1 = i_val_1 - i_val_2.

  endmethod.
ENDCLASS.

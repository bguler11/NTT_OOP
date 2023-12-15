interface ZBG_INT_INSTANCE
  public .


  types VALUE type /STTPEC/E_MAXHITS_DB .

  methods SUM
    importing
      !I_VAL_1 type /STTPEC/E_MAXHITS_DB optional
      !I_VAL_2 type /STTPEC/E_MAXHITS_DB optional
    exporting
      !E_VAL_1 type /STTPEC/E_MAXHITS_DB .
endinterface.

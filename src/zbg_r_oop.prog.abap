*&---------------------------------------------------------------------*
*& Report ZBG_R_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbg_r_oop.

CLASS lcl_main DEFINITION DEFERRED.
DATA go_main TYPE REF TO lcl_main.

SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME.
  PARAMETERS : p1 TYPE /sttpec/e_maxhits_db,
               p2 TYPE /sttpec/e_maxhits_db,
               p3 TYPE /sttpec/e_maxhits_db,
               p4 TYPE /sttpec/e_maxhits_db.
SELECTION-SCREEN END OF BLOCK b1.

CLASS lcl_main DEFINITION CREATE PRIVATE FINAL.
  PUBLIC SECTION.
    CLASS-METHODS: get_instance
      RETURNING VALUE(ro_main) TYPE REF TO lcl_main.

    METHODS:
      call.
    CLASS-DATA:
    mo_main      TYPE REF TO lcl_main.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.
  METHOD get_instance.
    IF mo_main IS INITIAL.
      CREATE OBJECT mo_main.
    ENDIF.
    ro_main = mo_main.
  ENDMETHOD.
  METHOD call.
    TYPES: BEGIN OF ty_data,
      sum1 TYPE /sttpec/e_maxhits_db,
      sum2 TYPE /sttpec/e_maxhits_db,
      subs1 TYPE /sttpec/e_maxhits_db,
      subs2 TYPE /sttpec/e_maxhits_db,
     END OF ty_data.

    DATA lt_data TYPE STANDARD TABLE OF ty_data.
    DATA lv_result_sum TYPE /sttpec/e_maxhits_db.
    DATA lv_result_sum2 TYPE /sttpec/e_maxhits_db.
    DATA lv_result_subs TYPE /sttpec/e_maxhits_db.
    DATA lv_result_subs2 TYPE /sttpec/e_maxhits_db.
    DATA lo_c1 TYPE REF TO zbg_c_class1.
    DATA lo_c2 TYPE REF TO zbg_c_class1.
    DATA lo_c3 TYPE REF TO zbg_c_class2.

    lo_c1 = NEW #( ).
    lo_c2 = NEW #( ).
    lo_c3 = NEW #( ).

    lo_c1->zbg_int_instance~sum(
      EXPORTING
        i_val_1 = p1                 " Sonuç girişi azami sayısı
        i_val_2 = p2                 " Sonuç girişi azami sayısı
      IMPORTING
        e_val_1 = lv_result_sum                 " Sonuç girişi azami sayısı
    ).

    lo_c1->zbg_int_stat~subs(
      EXPORTING
        i_val_1 =  p1                " Sonuç girişi azami sayısı
        i_val_2 =  p2                " Sonuç girişi azami sayısı
      IMPORTING
        e_val_1 =  lv_result_subs              " Sonuç girişi azami sayısı
    ).

    lo_c2->zbg_int_instance~sum(
      EXPORTING
        i_val_1 = p3                 " Sonuç girişi azami sayısı
        i_val_2 = p4                 " Sonuç girişi azami sayısı
      IMPORTING
        e_val_1 = lv_result_sum2                 " Sonuç girişi azami sayısı
    ).

    lo_c2->zbg_int_stat~subs(
      EXPORTING
        i_val_1 =  p3                " Sonuç girişi azami sayısı
        i_val_2 =  p4                " Sonuç girişi azami sayısı
      IMPORTING
        e_val_1 =  lv_result_subs2              " Sonuç girişi azami sayısı
    ).

    lo_c3->call( ).

    APPEND INITIAL LINE TO lt_data ASSIGNING FIELD-SYMBOL(<fs_data>).
    <fs_data>-sum1 = lv_result_sum.
    <fs_data>-sum2 = lv_result_sum2.
    <fs_data>-subs1 = lv_result_subs.
    <fs_data>-subs2 = lv_result_subs2.


  cl_demo_output=>display( lt_data ).


  ENDMETHOD.
ENDCLASS.

INITIALIZATION.
  go_main = lcl_main=>get_instance( ).


START-OF-SELECTION.
  go_main->call( ).

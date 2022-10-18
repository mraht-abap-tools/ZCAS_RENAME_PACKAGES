*&---------------------------------------------------------------------*
*& Include zcas_r_rename_packages_cls
*&---------------------------------------------------------------------*
CLASS lcl_application DEFINITION.

  PUBLIC SECTION.
    CLASS-METHODS: execute
      IMPORTING
        iv_nspc_o TYPE namespace
        iv_nspc_n TYPE namespace.

  PRIVATE SECTION.
    TYPES: BEGIN OF s_tdevc_chg,
             old_devc TYPE devclass,
             new_devc TYPE devclass,
           END OF s_tdevc_chg,
           t_tdevc_chg TYPE STANDARD TABLE OF s_tdevc_chg WITH DEFAULT KEY.

    CONSTANTS: mc_obj_type_devc TYPE trobjtype VALUE 'DEVC'.

    CLASS-DATA: mv_nspc_o   TYPE namespace,
                mv_nspc_n   TYPE namespace,
                mv_sql_devc TYPE string.

ENDCLASS.


CLASS lcl_application IMPLEMENTATION.

  METHOD execute.

    CHECK iv_nspc_o IS NOT INITIAL
      AND iv_nspc_n IS NOT INITIAL.

    mv_nspc_o   = iv_nspc_o.
    mv_nspc_n   = iv_nspc_n.
    mv_sql_devc = |{ iv_nspc_o }%|.

    SELECT FROM tdevc
      FIELDS *
      WHERE devclass LIKE @mv_sql_devc
      INTO TABLE @DATA(lt_tdevc).



  ENDMETHOD.

ENDCLASS.

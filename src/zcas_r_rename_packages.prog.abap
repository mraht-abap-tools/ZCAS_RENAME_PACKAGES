*&---------------------------------------------------------------------*
*& Report zcas_r_rename_packages
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcas_r_rename_packages.

INCLUDE zcas_r_rename_packages_cls.

##TODO.
" - Add to transport requests if needed (checkbox)

PARAMETERS: p_nspc_o TYPE namespace OBLIGATORY,
            p_nspc_n TYPE namespace OBLIGATORY.

START-OF-SELECTION.
  lcl_application=>execute( iv_nspc_o = p_nspc_o
                            iv_nspc_n = p_nspc_n ).

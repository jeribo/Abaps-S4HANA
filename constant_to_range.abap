    DATA:
      ref_descr     TYPE REF TO cl_abap_structdescr,
      it_components TYPE abap_compdescr_tab,
      ltab_name     TYPE tabname,
      l_data        TYPE REF TO data.
    FIELD-SYMBOLS:
      <fs_any>   TYPE any,
      <fs_table> TYPE STANDARD TABLE.
    "Pega componentes da constante
    ref_descr ?= cl_abap_typedescr=>describe_by_data( im_constant ).
    it_components[] = ref_descr->components[].
    LOOP AT it_components INTO DATA(ls_comp).
      APPEND INITIAL LINE TO ex_range
        ASSIGNING FIELD-SYMBOL(<line>).
      ASSIGN COMPONENT ls_comp-name OF STRUCTURE im_constant TO FIELD-SYMBOL(<value>).
      ASSIGN COMPONENT 'SIGN' OF STRUCTURE <line> TO <fs_any>.
      <fs_any> = rs_c_range_sign-including.
      UNASSIGN <fs_any>.

      ASSIGN COMPONENT 'OPTION' OF STRUCTURE <line> TO <fs_any>.
      <fs_any> = rs_c_range_opt-equal.
      UNASSIGN <fs_any>.

      ASSIGN COMPONENT 'LOW' OF STRUCTURE <line> TO <fs_any>.
      <fs_any> = <value>.
      UNASSIGN <fs_any>.


    ENDLOOP.

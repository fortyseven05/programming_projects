pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2018 (20180523-73)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_interpreter" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#62dd3eec#;
   pragma Export (C, u00001, "interpreterB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#0f7d71d4#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#f8088b52#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#16307b94#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#085b6ffb#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#4d58644d#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#bd45c2cc#;
   pragma Export (C, u00012, "system__secondary_stackB");
   u00013 : constant Version_32 := 16#4dcf97e2#;
   pragma Export (C, u00013, "system__secondary_stackS");
   u00014 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#40b73bd0#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#259825ff#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00018, "system__soft_links__initializeB");
   u00019 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00019, "system__soft_links__initializeS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#86e40413#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#55f506b9#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00024, "system__exceptionsB");
   u00025 : constant Version_32 := 16#6038020d#;
   pragma Export (C, u00025, "system__exceptionsS");
   u00026 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00026, "system__exceptions__machineB");
   u00027 : constant Version_32 := 16#3bad9081#;
   pragma Export (C, u00027, "system__exceptions__machineS");
   u00028 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00028, "system__exceptions_debugB");
   u00029 : constant Version_32 := 16#76d1963f#;
   pragma Export (C, u00029, "system__exceptions_debugS");
   u00030 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00030, "system__img_intB");
   u00031 : constant Version_32 := 16#0a808f39#;
   pragma Export (C, u00031, "system__img_intS");
   u00032 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00032, "system__tracebackB");
   u00033 : constant Version_32 := 16#5679b13f#;
   pragma Export (C, u00033, "system__tracebackS");
   u00034 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00034, "system__traceback_entriesB");
   u00035 : constant Version_32 := 16#0800998b#;
   pragma Export (C, u00035, "system__traceback_entriesS");
   u00036 : constant Version_32 := 16#bb296fbb#;
   pragma Export (C, u00036, "system__traceback__symbolicB");
   u00037 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00037, "system__traceback__symbolicS");
   u00038 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00038, "ada__exceptions__tracebackB");
   u00039 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00039, "ada__exceptions__tracebackS");
   u00040 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00040, "system__address_imageB");
   u00041 : constant Version_32 := 16#a9b7f2c1#;
   pragma Export (C, u00041, "system__address_imageS");
   u00042 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00042, "system__wch_conB");
   u00043 : constant Version_32 := 16#13264d29#;
   pragma Export (C, u00043, "system__wch_conS");
   u00044 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00044, "system__wch_stwB");
   u00045 : constant Version_32 := 16#3e376128#;
   pragma Export (C, u00045, "system__wch_stwS");
   u00046 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00046, "system__wch_cnvB");
   u00047 : constant Version_32 := 16#1c91f7da#;
   pragma Export (C, u00047, "system__wch_cnvS");
   u00048 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00048, "interfacesS");
   u00049 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00049, "system__wch_jisB");
   u00050 : constant Version_32 := 16#9ce1eefb#;
   pragma Export (C, u00050, "system__wch_jisS");
   u00051 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00051, "ada__tagsB");
   u00052 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00052, "ada__tagsS");
   u00053 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00053, "system__htableB");
   u00054 : constant Version_32 := 16#8c99dc11#;
   pragma Export (C, u00054, "system__htableS");
   u00055 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00055, "system__string_hashB");
   u00056 : constant Version_32 := 16#2ec7b76f#;
   pragma Export (C, u00056, "system__string_hashS");
   u00057 : constant Version_32 := 16#3cdd1378#;
   pragma Export (C, u00057, "system__unsigned_typesS");
   u00058 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00058, "system__val_lluB");
   u00059 : constant Version_32 := 16#462f440a#;
   pragma Export (C, u00059, "system__val_lluS");
   u00060 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00060, "system__val_utilB");
   u00061 : constant Version_32 := 16#a4fbd905#;
   pragma Export (C, u00061, "system__val_utilS");
   u00062 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00062, "system__case_utilB");
   u00063 : constant Version_32 := 16#378ed9af#;
   pragma Export (C, u00063, "system__case_utilS");
   u00064 : constant Version_32 := 16#927a893f#;
   pragma Export (C, u00064, "ada__text_ioB");
   u00065 : constant Version_32 := 16#1ffab6e1#;
   pragma Export (C, u00065, "ada__text_ioS");
   u00066 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00066, "ada__streamsB");
   u00067 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00067, "ada__streamsS");
   u00068 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00068, "ada__io_exceptionsS");
   u00069 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00069, "interfaces__c_streamsB");
   u00070 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00070, "interfaces__c_streamsS");
   u00071 : constant Version_32 := 16#4e0ce0a1#;
   pragma Export (C, u00071, "system__crtlS");
   u00072 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00072, "system__file_ioB");
   u00073 : constant Version_32 := 16#af2a8e9e#;
   pragma Export (C, u00073, "system__file_ioS");
   u00074 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00074, "ada__finalizationS");
   u00075 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00075, "system__finalization_rootB");
   u00076 : constant Version_32 := 16#47a91c6b#;
   pragma Export (C, u00076, "system__finalization_rootS");
   u00077 : constant Version_32 := 16#0f8892f9#;
   pragma Export (C, u00077, "system__os_libB");
   u00078 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00078, "system__os_libS");
   u00079 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00079, "system__stringsB");
   u00080 : constant Version_32 := 16#684d436e#;
   pragma Export (C, u00080, "system__stringsS");
   u00081 : constant Version_32 := 16#f5c4f553#;
   pragma Export (C, u00081, "system__file_control_blockS");
   u00082 : constant Version_32 := 16#fa14f7ad#;
   pragma Export (C, u00082, "lexical_analyzersB");
   u00083 : constant Version_32 := 16#289ab005#;
   pragma Export (C, u00083, "lexical_analyzersS");
   u00084 : constant Version_32 := 16#9094876d#;
   pragma Export (C, u00084, "ada__assertionsB");
   u00085 : constant Version_32 := 16#1a0b0d2c#;
   pragma Export (C, u00085, "ada__assertionsS");
   u00086 : constant Version_32 := 16#52f1910f#;
   pragma Export (C, u00086, "system__assertionsB");
   u00087 : constant Version_32 := 16#c5d6436f#;
   pragma Export (C, u00087, "system__assertionsS");
   u00088 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00088, "ada__charactersS");
   u00089 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00089, "ada__characters__handlingB");
   u00090 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00090, "ada__characters__handlingS");
   u00091 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00091, "ada__characters__latin_1S");
   u00092 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00092, "ada__stringsS");
   u00093 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00093, "ada__strings__mapsB");
   u00094 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00094, "ada__strings__mapsS");
   u00095 : constant Version_32 := 16#98e13b0e#;
   pragma Export (C, u00095, "system__bit_opsB");
   u00096 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00096, "system__bit_opsS");
   u00097 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00097, "ada__strings__maps__constantsS");
   u00098 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00098, "ada__containersS");
   u00099 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00099, "system__concat_2B");
   u00100 : constant Version_32 := 16#0afbb82b#;
   pragma Export (C, u00100, "system__concat_2S");
   u00101 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00101, "system__concat_4B");
   u00102 : constant Version_32 := 16#763f44db#;
   pragma Export (C, u00102, "system__concat_4S");
   u00103 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00103, "system__concat_3B");
   u00104 : constant Version_32 := 16#032b335e#;
   pragma Export (C, u00104, "system__concat_3S");
   u00105 : constant Version_32 := 16#2e260032#;
   pragma Export (C, u00105, "system__storage_pools__subpoolsB");
   u00106 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00106, "system__storage_pools__subpoolsS");
   u00107 : constant Version_32 := 16#d96e3c40#;
   pragma Export (C, u00107, "system__finalization_mastersB");
   u00108 : constant Version_32 := 16#53a75631#;
   pragma Export (C, u00108, "system__finalization_mastersS");
   u00109 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00109, "system__img_boolB");
   u00110 : constant Version_32 := 16#fd821e10#;
   pragma Export (C, u00110, "system__img_boolS");
   u00111 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00111, "system__ioB");
   u00112 : constant Version_32 := 16#961998b4#;
   pragma Export (C, u00112, "system__ioS");
   u00113 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00113, "system__storage_poolsB");
   u00114 : constant Version_32 := 16#2bb6f156#;
   pragma Export (C, u00114, "system__storage_poolsS");
   u00115 : constant Version_32 := 16#84042202#;
   pragma Export (C, u00115, "system__storage_pools__subpools__finalizationB");
   u00116 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00116, "system__storage_pools__subpools__finalizationS");
   u00117 : constant Version_32 := 16#bc471de0#;
   pragma Export (C, u00117, "system__val_enumB");
   u00118 : constant Version_32 := 16#b3412d6e#;
   pragma Export (C, u00118, "system__val_enumS");
   u00119 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00119, "system__val_intB");
   u00120 : constant Version_32 := 16#40fe45c4#;
   pragma Export (C, u00120, "system__val_intS");
   u00121 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00121, "system__val_unsB");
   u00122 : constant Version_32 := 16#2c75fe43#;
   pragma Export (C, u00122, "system__val_unsS");
   u00123 : constant Version_32 := 16#84211c4d#;
   pragma Export (C, u00123, "tokensB");
   u00124 : constant Version_32 := 16#668c34b8#;
   pragma Export (C, u00124, "tokensS");
   u00125 : constant Version_32 := 16#3cd48df1#;
   pragma Export (C, u00125, "system__val_charB");
   u00126 : constant Version_32 := 16#7fffed59#;
   pragma Export (C, u00126, "system__val_charS");
   u00127 : constant Version_32 := 16#2b93a046#;
   pragma Export (C, u00127, "system__img_charB");
   u00128 : constant Version_32 := 16#946f371c#;
   pragma Export (C, u00128, "system__img_charS");
   u00129 : constant Version_32 := 16#bcec81df#;
   pragma Export (C, u00129, "ada__containers__helpersB");
   u00130 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00130, "ada__containers__helpersS");
   u00131 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00131, "system__atomic_countersB");
   u00132 : constant Version_32 := 16#bc074276#;
   pragma Export (C, u00132, "system__atomic_countersS");
   u00133 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00133, "system__pool_globalB");
   u00134 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00134, "system__pool_globalS");
   u00135 : constant Version_32 := 16#2323a8af#;
   pragma Export (C, u00135, "system__memoryB");
   u00136 : constant Version_32 := 16#512609cf#;
   pragma Export (C, u00136, "system__memoryS");
   u00137 : constant Version_32 := 16#039168f8#;
   pragma Export (C, u00137, "system__stream_attributesB");
   u00138 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00138, "system__stream_attributesS");
   u00139 : constant Version_32 := 16#86ecf8ab#;
   pragma Export (C, u00139, "system__strings__stream_opsB");
   u00140 : constant Version_32 := 16#ec029138#;
   pragma Export (C, u00140, "system__strings__stream_opsS");
   u00141 : constant Version_32 := 16#db0aa7dc#;
   pragma Export (C, u00141, "ada__streams__stream_ioB");
   u00142 : constant Version_32 := 16#55e6e4b0#;
   pragma Export (C, u00142, "ada__streams__stream_ioS");
   u00143 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00143, "system__communicationB");
   u00144 : constant Version_32 := 16#113b3a29#;
   pragma Export (C, u00144, "system__communicationS");
   u00145 : constant Version_32 := 16#827070f5#;
   pragma Export (C, u00145, "parsersB");
   u00146 : constant Version_32 := 16#b7a28402#;
   pragma Export (C, u00146, "parsersS");
   u00147 : constant Version_32 := 16#2d5995f8#;
   pragma Export (C, u00147, "arithmetic_expressionsB");
   u00148 : constant Version_32 := 16#069e4e0c#;
   pragma Export (C, u00148, "arithmetic_expressionsS");
   u00149 : constant Version_32 := 16#ab72da18#;
   pragma Export (C, u00149, "memoryB");
   u00150 : constant Version_32 := 16#9c211c4b#;
   pragma Export (C, u00150, "memoryS");
   u00151 : constant Version_32 := 16#dde34de3#;
   pragma Export (C, u00151, "system__exp_intB");
   u00152 : constant Version_32 := 16#11785907#;
   pragma Export (C, u00152, "system__exp_intS");
   u00153 : constant Version_32 := 16#60a0c945#;
   pragma Export (C, u00153, "idsB");
   u00154 : constant Version_32 := 16#efd8d0b2#;
   pragma Export (C, u00154, "idsS");
   u00155 : constant Version_32 := 16#87953cc9#;
   pragma Export (C, u00155, "boolean_expressionsB");
   u00156 : constant Version_32 := 16#88de64a9#;
   pragma Export (C, u00156, "boolean_expressionsS");
   u00157 : constant Version_32 := 16#375dee29#;
   pragma Export (C, u00157, "itersB");
   u00158 : constant Version_32 := 16#e66c7b69#;
   pragma Export (C, u00158, "itersS");
   u00159 : constant Version_32 := 16#57658bfa#;
   pragma Export (C, u00159, "programsB");
   u00160 : constant Version_32 := 16#fd1ebe2c#;
   pragma Export (C, u00160, "programsS");
   u00161 : constant Version_32 := 16#c8be2174#;
   pragma Export (C, u00161, "statementsB");
   u00162 : constant Version_32 := 16#7f8b72db#;
   pragma Export (C, u00162, "statementsS");
   u00163 : constant Version_32 := 16#273384e4#;
   pragma Export (C, u00163, "system__img_enum_newB");
   u00164 : constant Version_32 := 16#6917693b#;
   pragma Export (C, u00164, "system__img_enum_newS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.exp_int%s
   --  system.exp_int%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_char%s
   --  system.img_char%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.wch_stw%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  ada.exceptions%s
   --  system.wch_stw%b
   --  ada.exceptions.traceback%s
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  ada.exceptions.last_chance_handler%s
   --  system.memory%s
   --  system.memory%b
   --  ada.exceptions.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%b
   --  system.standard_library%b
   --  ada.exceptions%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_char%s
   --  system.val_char%b
   --  system.val_enum%s
   --  system.val_enum%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.communication%s
   --  system.communication%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.file_io%s
   --  system.file_io%b
   --  ada.streams.stream_io%s
   --  ada.streams.stream_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools%b
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.assertions%s
   --  system.assertions%b
   --  ada.assertions%s
   --  ada.assertions%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  ada.characters.handling%s
   --  ada.characters.handling%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  tokens%s
   --  tokens%b
   --  ids%s
   --  ids%b
   --  lexical_analyzers%s
   --  lexical_analyzers%b
   --  memory%s
   --  memory%b
   --  arithmetic_expressions%s
   --  arithmetic_expressions%b
   --  boolean_expressions%s
   --  boolean_expressions%b
   --  iters%s
   --  iters%b
   --  statements%s
   --  statements%b
   --  programs%s
   --  programs%b
   --  parsers%s
   --  parsers%b
   --  interpreter%b
   --  END ELABORATION ORDER

end ada_main;

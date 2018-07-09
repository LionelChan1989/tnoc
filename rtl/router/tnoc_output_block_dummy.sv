module tnoc_output_block_dummy
  `include  "tnoc_default_imports.svh"
#(
  parameter tnoc_config CONFIG  = TNOC_DEFAULT_CONFIG
)(
  tnoc_flit_if.target             flit_in_if_xp,
  tnoc_flit_if.target             flit_in_if_xm,
  tnoc_flit_if.target             flit_in_if_yp,
  tnoc_flit_if.target             flit_in_if_ym,
  tnoc_flit_if.target             flit_in_if_l,
  tnoc_flit_if.initiator          flit_out_if,
  tnoc_port_control_if.arbitrator port_control_if_xp,
  tnoc_port_control_if.arbitrator port_control_if_xm,
  tnoc_port_control_if.arbitrator port_control_if_yp,
  tnoc_port_control_if.arbitrator port_control_if_ym,
  tnoc_port_control_if.arbitrator port_control_if_l
);
  `include  "tnoc_macros.svh"

  `tnoc_internal_flit_if(CONFIG.virtual_channels) flit_in_if[5]();
  tnoc_port_control_if #(CONFIG)                  port_control_if[5]();

  `tnoc_flit_if_renamer(flit_in_if_xp, flit_in_if[0]);
  `tnoc_flit_if_renamer(flit_in_if_xm, flit_in_if[1]);
  `tnoc_flit_if_renamer(flit_in_if_yp, flit_in_if[2]);
  `tnoc_flit_if_renamer(flit_in_if_ym, flit_in_if[3]);
  `tnoc_flit_if_renamer(flit_in_if_l , flit_in_if[4]);

  `tnoc_port_control_if_renamer(port_control_if_xp, port_control_if[0]);
  `tnoc_port_control_if_renamer(port_control_if_xm, port_control_if[1]);
  `tnoc_port_control_if_renamer(port_control_if_yp, port_control_if[2]);
  `tnoc_port_control_if_renamer(port_control_if_ym, port_control_if[3]);
  `tnoc_port_control_if_renamer(port_control_if_l , port_control_if[4]);

  assign  flit_out_if.valid = '0;
  for (genvar i = 0;i < CONFIG.virtual_channels;++i) begin
    assign  flit_out_if.flit[i] = '0;
  end

  for (genvar i = 0;i < 5;++i) begin
    assign  flit_in_if[i].ready         = '0;
    assign  flit_in_if[i].vc_available  = '0;

    assign  port_control_if[i].grant  = '0;
  end
endmodule

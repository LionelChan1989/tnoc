`ifndef TNOC_CONFIG_PKG_SV
`define TNOC_CONFIG_PKG_SV
package tnoc_config_pkg;
  typedef struct {
    int address_width;
    int data_width;
    int id_x_width;
    int id_y_width;
    int virtual_channels;
    int tag_width;
    int burst_length_width;
    int input_fifo_depth;
    int size_x;
    int size_y;
  } tnoc_config;

  parameter tnoc_config TNOC_DEFAULT_CONFIG = '{
    address_width:      64,
    data_width:         256,
    id_x_width:         5,
    id_y_width:         5,
    virtual_channels:   2,
    tag_width:          8,
    burst_length_width: 8,
    input_fifo_depth:   8,
    size_x:             3,
    size_y:             3
  };
endpackage
`endif

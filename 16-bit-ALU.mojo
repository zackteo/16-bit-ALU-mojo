<?xml version="1.0" encoding="UTF-8"?>
<project name="16-bit-ALU" board="Mojo V3" language="Lucid">
  <files>
    <src>alu.luc</src>
    <src>shifter_16bit.luc</src>
    <src>adder_16bit_1.luc</src>
    <src>boolean_16bit.luc</src>
    <src>multiply_16bit.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>adder_16bit_2.luc</src>
    <src>compare16bit.luc</src>
    <ucf>io.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>

`default_nettype none

module bitmap_rom (
    input wire [6:0] x,
    input wire [6:0] y,
    output wire pixel
);

    // Definición de la memoria de forma estándar para que Yosys la infiera correctamente
    reg [7:0] mem [2047:0];

    // Carga inicial limpia y profesional desde un archivo de texto hexadecimal (rom.hex)
    initial begin
        $readmemh("rom.hex", mem);
    end

    // Mapeo directo de las direcciones combinacionales
    wire [10:0] addr = {y[6:0], x[6:3]};
    assign pixel = mem[addr][x & 3'h7];

endmodule

module AND_OR(andOut, orOut, A, B);
 output logic andOut, orOut;
 input logic A, B;
 and TheAndGate (andOut, A, B);
 or TheOrGate (orOut, A, B);
endmodule
// Compute the logical NAND and NOR of inputs X and Y.
module NAND_NOR(nandOut, norOut, X, Y);
 output logic nandOut, norOut;
 input logic X, Y;
 logic andVal, orVal;
 AND_OR aoSubmodule (.andOut(andVal), .orOut(orVal),
 .A(X), .B(Y));
 not n1 (nandOut, andVal);
 not n2 (norOut, orVal);
endmodule
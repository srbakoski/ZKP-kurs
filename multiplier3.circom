pragma circom 2.1.6;

include "circomlib/poseidon.circom";

template Multiplier3 () {
    signal input a;
    signal input b;
    signal input c;
    signal pom;
    signal output d;

    /* Nekvadratni constraintovi nisu dozvoljeni, pa moramo da mnozimo dva po dva broja */
    pom <== a*b;
    d <== c*pom;
}

component main = Multiplier3();

/* INPUT = {
    "a": "5",
    "b": "6",
    "c": "7"
} */

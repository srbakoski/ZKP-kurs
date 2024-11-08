pragma circom 2.1.6;

include "circomlib/comparators.circom";
include "circomlib/babyjub.circom";

template PrivateKeyCheck () {
    signal input priv_key;
    signal input pub_key[2];
    signal output answer;
    
    component public_key = BabyPbk();
    public_key.in <== priv_key;
    component prvakoordinata = IsEqual();
    prvakoordinata.in[0] <== public_key.Ax;
    prvakoordinata.in[1] <== pub_key[0];
    component drugakoordinata = IsEqual();
    drugakoordinata.in[0] <== public_key.Ay;
    drugakoordinata.in[1] <== pub_key[1];

    /* ako se obe koordinate poklapaju, onda je izlaz oba templejta 1, pa ce i answer biti 1.
    Ako se bar jedna komponenta ne poklapa, onda ce answer biti 0 */
    answer <== prvakoordinata.out * drugakoordinata.out;
}

component main { public [pub_key] } = PrivateKeyCheck();

/* INPUT = {
    "priv_key": "5",
    "pub_key": [" 11480966271046430430613841218147196773252373073876138147006741179837832100836",
    "15148236048131954717802795400425086368006776860859772698778589175317365693546"]
} */

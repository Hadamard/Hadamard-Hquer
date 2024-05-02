# Hadamard-Ħ

Ħ (h quer) is an ERC-20 token that implements the functionality and physically based unbreakable security of quantum key distribution.


# How would quantum supremacy affect Ethereum?

Ethereum currently uses elliptic curve based schemes like the ECDSA scheme for signing transactions and BLS for signature aggregation. Elliptic curve cryptography in which security is based upon the difficulty of solving the discrete logarithm is vulnerable to quantum computing and must be replaced with a quantum-resistant scheme.

The hash function SHA-256 is quantum-safe, which means that there is no efficient known algorithm, classical or quantum, which can invert it.

While there is a known quantum algorithm, Grover’s algorithm, which performs “quantum search” over a black-box function, SHA-256 has proven to be secure against both collision and preimage attacks. In fact, Grover’s algorithm can only reduce 𝑁 queries of the black-box function, SHA in this case, to √N, so instead of searching 2^256 possibilities, we only have to search 2^128, which is even slower than algorithms like van Oorschot–Wiener algorithm for generic collision search and Oechslin's rainbow tables for generic pre-image search on classical computers. ****

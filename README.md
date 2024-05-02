# Hadamard-Ħ

Ħ (h quer) is an ERC-20 token that implements the functionality and physically based unbreakable security of quantum key distribution.


# How would Quantum Supremacy affect Ethereum?


* SA is an algorithm used for encryption and based upon the hardness of solving the factorisation problem (finding the factors of a large composite number is difficult: when the integers are prime numbers) 

* ECDSA: Is a signature scheme based upon the hardness of solving the discrete logarithm problem.

While computing discrete logarithms and factoring integers are distinct problems, they both are solvable using quantum computers.

* In 1994, American mathematician Peter Shor invented a quantum algorithm that cracks the RSA algorithm in polynomial time versus 300 trillion years on a classical computer for RSA with 2048-bit.

* ECDSA has shown to be vulnerable to a modified version of Shor's algorithm and is even easier to solve than RSA using quantum computers because of the smaller key space.

* A 160-bit elliptic curve cryptographic key could be broken on a quantum computer using around 1000 qubits while factoring the security-wise equivalent 1024-bit RSA modulus would require about 2000 qubits.



Ethereum currently uses elliptic curve based schemes like the ECDSA scheme for signing transactions and BLS for signature aggregation. Elliptic curve cryptography in which security is based upon the difficulty of solving the discrete logarithm is vulnerable to quantum computing and must be replaced with a quantum-resistant scheme.

The hash function SHA-256 is quantum-safe, which means that there is no efficient known algorithm, classical or quantum, which can invert it.

While there is a known quantum algorithm, Grover’s algorithm, which performs “quantum search” over a black-box function, SHA-256 has proven to be secure against both collision and preimage attacks. In fact, Grover’s algorithm can only reduce 𝑁 queries of the black-box function, SHA in this case, to √N, so instead of searching 2^256 possibilities, we only have to search 2^128, which is even slower than algorithms like van Oorschot–Wiener algorithm for generic collision search and Oechslin's rainbow tables for generic pre-image search on classical computers. 

# Hadamard's solution

The above-mentioned vulnerability of signing is addressed by Hadamard-Ħ and has been used to design an unbreakable quantum-resistant protocol for the signer.

* Quantum-Secure Key Generation: The involved parties, such as an Ethereum transaction sender and a node in the Ethereum network, utilize Quantum Key Distribution (QKD) to generate a quantum-secure key. By leveraging principles of quantum mechanics, a key is generated that cannot be compromised even by a potential quantum computer. This key is securely exchanged between the parties, establishing a basis for a secure communication channel.

* Key Exchange and Authentication: The generated quantum-secure key is used to sign transactions and authenticate the identities of the involved parties. Before a transaction is sent, it is encrypted with the jointly generated key to ensure its confidentiality and to ensure that it can only be read by the authorized parties.

* Signing the Encrypted Transaction: After encryption, the sender signs the transaction with their private key, similar to conventional signature methods. However, since the transaction is already encrypted, it can only be decrypted and read by the intended recipient.

* Decryption and Verification: The recipient decrypts the received transaction using the jointly generated quantum-secure key, and then verifies the signature to ensure that the transaction is authentic and indeed originates from the specified sender.

Hadamard Ħ is the first developed smart contract that provides a quantum infrastructure and makes Ethereum's security quantum-resistant for a long time.


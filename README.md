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

* Quantum-Secure Key Establishment: Employ Quantum Key Distribution (QKD) between the communicating parties to establish a quantum-secure key. QKD utilizes quantum mechanical principles to create secure keys between sender and receiver, ensuring resistance against potential eavesdropping or manipulation by adversaries.

* Key Exchange and Authentication: Utilize the quantum-secure key for authentication and signing purposes. Following the establishment of the quantum-secure key, it is used to encrypt messages, preserving confidentiality and restricting access solely to the intended recipient.

* Signing of Encrypted Messages: Upon encryption of the message using the quantum-secure key, the sender employs their private key to sign the encrypted message. However, as the message is already encrypted, it remains decipherable solely by the intended recipient, ensuring confidentiality and integrity during transmission.

* Decryption and Verification: The recipient decrypts the received message using the established quantum-secure key and subsequently verifies the signature to ascertain the authenticity of the message and its origin.

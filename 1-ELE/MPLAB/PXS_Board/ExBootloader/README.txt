
>>> BOOTLOADER SETUP <<<

§ The bootloader is used to check code consistency at each boot and have the chance to update application FW after production (typically through encrypted communication); 

§ In order to support bootloader features, an MCU program memory shall have be designed with a specific initial (or sometimes final) section dedicated for the bootloader code;

§ For dsPIC33 MCUs the program memory (aka flash) is typically divided into x5 sections: RESET, IVT, BOOTLOADER, APPLICATION and CONFIGURATION;

§ For typical applications, the bootloader and IVT (aka Interrupt Vector Table) code are programmed only at production time and remain fixed (often remains the same even among different products), whereas the actual application code (including where ISRs implementation is written) can be changed in time (e.g. to update the code or fix a bug). To allow this, a possible solution is to create a "user remap IVT" in the application memory (and keeping the address-location of this RAIVT and of all of its entries fixed). However, there might arise issues if both bootloader and application software try to use same interrupts! Microchip's solution is the "Code-Guard" feature: when enabled, it creates a 2nd "virtual" IVT in the application memory (named "Alternative IVT", indepenednt of the primary IVT and thus not part of the bootloader section), so that while booting the bootloader code uses the primary IVT, and then (after switching to nominal operation) the application software uses the AIVT.

§ The x4 main tasks of the bootloader kernel are: [1] take care of the boot procedure, [2] check for application updates (through buttons, UART, etc), [3] verify the integrity of the application image before starting it (via CRC, SHA256, etc), [4] and transfer program flow from bootloader level to application image level after boot procedure is completed.

§ The most important bootloader-memory section is further divided into several sub-sections, where the most important one is the [A] bootloader-kernel (in charge for all the previous tasks). The kernel shall implement a set of mandatory commands: [1] "erase flash" to erase a desired number of pages in the application memory (i.e. only if the specified address range reside in the appication memory), [2] "program flash" to write pages of the application memory, [3] "read version" to check the bootloader version, [4] "read memory settings" to check start/final address of the application memory), [5] "self-verify" to check the application image consistency by means of the specified method (CRC, SHA256, etc). Other additional commands (which can be either enabled or disabled) are: [6] "read flash" to read specified range of program memory (which can also cause security risks in terms of intellectual property stealing), [7] "reset device" to force a soft-reset of the device.

§ Besides the kernel, the bootloader section has other sub-sections (in the program memory): [B] "verification driver" to check and approve/reject code verification using the specified method, [C] "communication driver" to communicate with the host through specific interface (UART, USB, I2C, etc).

§ The application memory section (in the program memory) is divided as well into several sub-sections: [A] "application certificate" involved in the verification process, [B] "user remap IVT" (or AIVT for Microchip), [C] "application code" independent of bootloader usage.



>>> SECURE BOOTLOADER <<<

§ Nowadays the x2 main security features (also covered by MPLAB) are: [1] "integrity" to be sure the firmware image has not been altered (due to either flash failure or intentional hacker attack) by calculating a checking binary string (called "digest") through some cryptographic hash functions (e.g. SHA-256), and [2] "authenticity" to be sure the code comes from a valid source (since someone could upload their own code with their correct digest value and the integrity check alone would not detect the issue) by a signature mechanism of the digest using some signing algorithm (e.g. ECDSA) fed with a private key (so that only someone knowing the private key can generate that specific signature). Then the signature is attached to the application image so that anyone can check the firmware autheticity through the public key (thus a pass/fail authentication result can be executing giving the digest, the public key and the image signature as input to the ECDSA function).

§ In particular, in MPLAB specific implementation, the application image (besides the actual application code) contains an initial header section to store the signature and some additional metadata (e.g. code start/end address). To generate the signature, first it is calculated the digest of metadata plus application code sections (e.g. with SHA256), then this digest is given as input to the ECDSA function along with the private key to produce the signature that is finally added in its specific location in the aforementioned application header.



>>> DEMO-PROJECT <<<

- BTN to force bootloader into the applciation update mode (by holdin it down while board is connected torough USB cable) -> RA7

- yellow LED to signal bootloader is running -> RC3

- blue LED as nominal application code operation -> RC5

- UART to download new firmware in bootloader mode -> RC8 (TX) + RC9 (RX)

- available bootloader verification methods : Flash-not-blank | CRC32 | SHA256 | ECDSA-with-ATECC608 

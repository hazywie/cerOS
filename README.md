# cerOS BASIC / Temel İşletim Sistemi

## English

### Overview
cerOS is a simple operating system developed from scratch using assembly language. The project consists of a bootloader that displays a welcome message and loads a kernel, and a kernel that prints "Kernel Loaded!" and continuously waits for keyboard input. This project serves as an educational tool for understanding low-level system programming and boot processes.

### Features
- **Bootloader:** Reads sectors from a floppy disk image to load the kernel.
- **Kernel:** Displays a message and echoes keyboard input.
- **Keyboard Input:** Demonstrates the use of BIOS interrupts to capture keystrokes.
- **Educational Purpose:** Provides a foundational example of booting and low-level hardware interaction.

### How to Build and Run
Follow these steps to assemble and run the cerOS:

1. **Install NASM and QEMU** (if not installed):  
   - Windows: Download [NASM](https://www.nasm.us/) and [QEMU](https://www.qemu.org/download/)  
   - Linux (Debian/Ubuntu):  
     ```bash
     sudo apt install nasm qemu-system-x86
     ```
   - macOS (using Homebrew):  
     ```bash
     brew install nasm qemu
     ```

2. **Clone the Repository and Enter the Directory:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/basic-os.git
   cd basic-os
   ```

3. **Assemble the Bootloader:**
   ```bash
   nasm -f bin boot.asm -o boot.bin
   ```

4. **Assemble the Kernel:**
   ```bash
   nasm -f bin kernel.asm -o kernel.bin
   ```

5. **Create the OS Image:**
   ```bash
   cat boot.bin kernel.bin > os-image.bin
   ```

6. **Run with QEMU (Floppy Mode):**
   ```bash
   qemu-system-x86_64 -fda os-image.bin
   ```

### How It Works
- The bootloader occupies the first 512 bytes, displays "Hello, OS!" and loads the kernel from subsequent sectors.
- The kernel is loaded at memory address 0x1000, prints "Kernel Loaded!" followed by "Press any key:", and then enters a loop waiting for keyboard input via BIOS interrupts.

---

## Türkçe

### Genel Bakış
cerOS Temel İşletim Sistemi, sıfırdan assembly dili kullanılarak geliştirilmiş basit bir işletim sistemidir. Proje, ekranda hoş geldiniz mesajı gösteren ve kernel’i yükleyen bir bootloader ile, "Kernel Loaded!" mesajını yazdıran ve klavye girişlerini alan bir kernel’den oluşur. Bu proje, düşük seviyeli sistem programlamayı ve önyükleme süreçlerini öğrenmek için eğitimsel bir araç olarak tasarlanmıştır.

### Özellikler
- **Bootloader:** Floppy disk imajından sektör okuyarak kernel’i yükler.
- **Kernel:** "Kernel Loaded!" mesajını yazdırır ve klavye girişlerini ekrana yansıtır.
- **Klavye Girişi:** BIOS kesintilerini kullanarak tuş girişlerini yakalar.
- **Eğitim Amaçlı:** Önyükleme ve düşük seviyeli donanım etkileşimlerinin temel örneğini sunar.

### Derleme ve Çalıştırma Adımları
Aşağıdaki adımları takip ederek cerOS’u çalıştırabilirsiniz:

1. **NASM ve QEMU’yu Kurun** (Eğer yüklü değilse):  
   - **Windows:** [NASM](https://www.nasm.us/) ve [QEMU](https://www.qemu.org/download/) indirin.  
   - **Linux (Debian/Ubuntu):**  
     ```bash
     sudo apt install nasm qemu-system-x86
     ```
   - **macOS (Homebrew ile):**  
     ```bash
     brew install nasm qemu
     ```

2. **Depoyu Klonlayın ve Klasöre Girin:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/basic-os.git
   cd basic-os
   ```

3. **Bootloader’ı Derleyin:**
   ```bash
   nasm -f bin boot.asm -o boot.bin
   ```

4. **Kernel’i Derleyin:**
   ```bash
   nasm -f bin kernel.asm -o kernel.bin
   ```

5. **İşletim Sistemi İmajını Oluşturun:**
   ```bash
   cat boot.bin kernel.bin > os-image.bin
   ```

6. **QEMU ile Çalıştırın (Floppy Modu):**
   ```bash
   qemu-system-x86_64 -fda os-image.bin
   ```

### Nasıl Çalışır?
- Bootloader, ilk 512 baytlık bölümde "Hello, OS!" mesajını gösterir ve sonraki sektörlerden kernel’i yükler.
- Kernel, 0x1000 adresinde çalışır; "Kernel Loaded!" mesajını yazdırır, ardından "Press any key:" mesajı ile klavye girişlerini BIOS kesintileriyle bekler.

---

## License / Lisans
This project is licensed under the MIT License.  
Bu proje MIT Lisansı kapsamında lisanslanmıştır.

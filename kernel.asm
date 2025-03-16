ORG 0x1000            ; Kernel'in RAM'de yüklenme adresi

section .text
    global _start

_start:
    ; Yığın (stack) kurulumunu yap: 
    ; Burada 0x9000 segmenti yığın için kullanılıyor, sp'yi yüksek bir değere ayarlıyoruz.
    mov ax, 0x9000    
    mov ss, ax
    mov sp, 0xFFFE

    ; "Kernel Loaded!" mesajını ekrana yazdır:
    mov ah, 0x0E
    mov al, 'K'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'r'
    int 0x10
    mov al, 'n'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 'L'
    int 0x10
    mov al, 'o'
    int 0x10
    mov al, 'a'
    int 0x10
    mov al, 'd'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'd'
    int 0x10
    mov al, '!'
    int 0x10

    ; Yeni satır:
    mov al, 0x0D   ; Carriage Return
    int 0x10
    mov al, 0x0A   ; Line Feed
    int 0x10

    ; "Press any key:" mesajını ekrana yazdır:
    mov ah, 0x0E
    mov al, 'P'
    int 0x10
    mov al, 'r'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 's'
    int 0x10
    mov al, 's'
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 'a'
    int 0x10
    mov al, 'n'
    int 0x10
    mov al, 'y'
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 'k'
    int 0x10
    mov al, 'e'
    int 0x10
    mov al, 'y'
    int 0x10
    mov al, ':'
    int 0x10
    mov al, ' '
    int 0x10

keyboard_loop:
    ; Klavyeden tuşa basılmasını bekle:
    mov ah, 0
    int 0x16       ; Tuş basıldığında AL, ASCII kodunu döner
    mov bl, al     ; AL değerini BL'e kopyala
    mov ah, 0x0E   ; Ekrana yazma fonksiyonu
    mov al, bl     ; BL'deki değeri AL'ye aktar
    int 0x10       ; Karakteri ekrana yazdır
    jmp keyboard_loop

    ; Kernel dosyasını en az 1KB yapmak için padding ekle:
    times 1024 - ($ - $$) db 0
